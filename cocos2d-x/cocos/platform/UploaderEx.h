#ifndef __UPLOADEREX_H_
#define __UPLOADEREX_H_

#include "cocos2d.h"

USING_NS_CC;
using namespace std;

NS_CC_BEGIN;

enum UploadMessage
{
	UPLOAD_COMPLETE = 0,
	UPLOAD_ERROR,
	FILE_CANNOT_OPEN,
	UPLOAD_URL_EMPTY,
	FILE_NAME_EMPTY
};

class UploaderEx : public Node
{
public:
	UploaderEx();
	virtual ~UploaderEx();

	UploaderEx(const char* fileName, const char* uploadUrl);

	static UploaderEx *create(const char* fileName = "", const char* uploadUrl = "");

	//开始上传
	void startUpload(); 

	//设定要上传的文件名
	void setFileName(const char* fileName);

	//设定要上传到的ftp服务器地址
	void setUploadUrl(const char* uploadUrl);

	//设定要上传的文件的路径
	void setFilePath(const char* filePath);

	//设置上传回调
	void setUploadCallBack(const std::function<void()> &callback);
	
private:
	void upload();
	void activeCallBack(UploadMessage msg, int curlErrorCode = 0);

private:
	string m_FileName;
	string m_FilePath;
	string m_UploadUrl;
	std::function<void()> m_callBack; //上传完成callBack
};

NS_CC_END;

#endif __UPLOADEREX_H_