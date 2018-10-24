﻿/****************************************************************************
 内容: 在线升级数据，下载文件为zip，下载后自动解压（解压后自动删除zip文件）,该类支持断点续传.
 ****************************************************************************/

#ifndef __UPGRADE_MANAGER_H_
#define __UPGRADE_MANAGER_H_

#include <string>

#include <mutex>

#include "2d/CCNode.h"
//#include "extensions/ExtensionMacros.h"
//#include "extensions/ExtensionExport.h"
#include "platform/CCFileUtils.h"
USING_NS_CC;

NS_CC_BEGIN

class DownloaderBPExDelegateProtocol;


class DownloaderBPEx : public Node
{
public:
	DownloaderBPEx();
	virtual ~DownloaderBPEx();

	/**
    * @brief 更新数据时的错误编码
    */
	enum class ErrorCode
    {
        // Error caused by creating a file to store downloaded data
        CREATE_FILE,//创建下载数据存储文件时错误
        /** Error caused by network
         -- network unavaivable
         -- timeout
         -- ...
         */
        NETWORK,//网络故障
        /** Error caused in uncompressing stage
         -- can not open zip file
         -- can not read file global information
         -- can not read file information
         -- can not create a directory
         -- ...
         */
        UNCOMPRESS,//解压缩错误
    };

	/**
    * @brief 设置下载的相关数据
	* @param packageUrl 下载文件的url
	* @param storagePath 下载文件的保存路径(解压后的文件也在该位置) 注：该路径为安装文件的私有文件夹下的相对路径
	*                    用于在私有文件夹下添加文件夹
    */
	DownloaderBPEx(const char* packageUrl, const char* storagePath);
	
	/**
    * @brief 设置下载url
	* @param packageUrl 下载文件的url
    */
	void setPackageUrl(const char* packageUrl);

	/**
    * @brief 设置下载文件存储地址
	* @param storagePath 下载文件的保存路径(解压后的文件也在该位置) 注：该路径为安装文件的私有文件夹下的相对路径,
	*                    用于在私有文件夹下添加文件夹
    */
	void setStoragePath(const char* storagePath);

	/**
    * @brief 设置接口对象
	* @param delegateProtocol 接口对象
    */
	void setDelegate(DownloaderBPExDelegateProtocol *delegateProtocol);

	/**
    * @brief 设置连接超时，单位为秒
	* @param timeout 超时时间
    */
	void setConnectionTimeout(unsigned int timeout);

	long getDownloadFileLenth();
	/**
    * @brief 线程接口（下载进度回调） 每次下载大小 不是总的大小
    */
	friend int assetsManagerProgressFunc(void *, double, double, double, double);

	/**
    * @brief 开始更新
    */
	void update();

	void packageName(const char* packageUrl);

	void setErrorListener(const std::function<void(Ref*,int errCode)>& cb);

	int getErrorCode();
	static DownloaderBPEx* create();
	static DownloaderBPEx* create(const char* packageUrl,const char* storagePath);

		/**
    * @brief 解压已下载的文件
	* @return 解压情况true：解压成功
    */
	bool uncompress();

	void unzip(const char* zipPath,const char* fileName,const char* unzipPath);

	int getUnzipInfo();
	std::string  basename(const std::string& path) ;

private:
	/**
    * @brief 检查下载文件存储地址
    */
	void checkStoragePath();

	/**
    * @brief 初始化存储路径
    */
	void createStoragePath();

	/**
    * @brief 下载
	* @return 
    */
	bool downLoad();

	/**
	* fopen函数调用如下：
	* fopen（“文件名”，“使用文件方式”）；
	* r：只读；
	* w：只写；
	* r+：允许读写；
	* w+：允许读写；
	* a：向文本文件末添加数据；
	* a+：向文本文件末添加数据，允许读；
	* rb：只读二进制文件；
	* wb：只写二进制文件；
	* rb+：只读二进制文件，允许写；
	* wb+：只写二进制文件，允许读；
	* ab：向二进制文件末添加数据；
	* ab+：向二进制文件末添加数据，允许读；
	*/
   /**
    * @brief 已下载文件的长度
	* @return 已下载文件的长度
    */
	long getLocalFileLength();

	 /**
    * @brief 设置搜索路径
    */
	void setSearchPath();

	 /**
    * @brief 下载并解压
    */
	void downloadAndUncompress();



	/*
	* @brief Create a direcotry is platform depended.
	*/
	bool createDirectory(const char *path);


private:
	FileUtils *_fileUtils;
	std::string m_sPackageUrl;//下载文件的url
	long m_FileLenth;//下载文件的大小
	std::string m_packageName;//设置的文件名
	std::string m_tempPackageName;//临时的名字
	std::function<void(Ref*,int errCode)> callBack;
	std::string m_unzipPath;//解压到的文件路径
	int m_unzipInfo;//解压文件的状态 0:正在解压 -1:解压失败 1:解压成功
	int m_ErrorCode;//下载中断的错误信息 查看curl.h的CURLcode
	std::string m_sStoragePath;//下载文件的保存路径(解压后的文件也在该位置) 注：该路径为安装文件的私有文件夹下的相对路径,用于在私有文件夹下添加文件夹
//	std::string m_sFileVersion;//文件版本号
	DownloaderBPExDelegateProtocol *m_pUMDelegateProtocol;//接口对象
	int m_nTimeOut;//超时时间
	void *m_pCurl;
	long m_lLocalFileLenth;//已下载文件长度

};

/**
 * @brief 下载管理接口
 */
class DownloaderBPExDelegateProtocol
{
public:
	virtual ~DownloaderBPExDelegateProtocol(){};

	/**
    * @brief 下载错误接口方法
	* @param errorCode 错误编码
    */
	virtual void onError(DownloaderBPEx::ErrorCode errorCode){};

	/**
    * @brief 下载进度（0 - 100）
	* @param percent 进度百分比
    */
	virtual void onProgress(int percent){};

	/**
    * @brief 下载下载完成并且解压完成
    */
	virtual void onSuccess() {};
};
NS_CC_END
#endif // !__UPGRADE_MANAGER_H_