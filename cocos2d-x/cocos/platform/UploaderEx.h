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

	//��ʼ�ϴ�
	void startUpload(); 

	//�趨Ҫ�ϴ����ļ���
	void setFileName(const char* fileName);

	//�趨Ҫ�ϴ�����ftp��������ַ
	void setUploadUrl(const char* uploadUrl);

	//�趨Ҫ�ϴ����ļ���·��
	void setFilePath(const char* filePath);

	//�����ϴ��ص�
	void setUploadCallBack(const std::function<void()> &callback);
	
private:
	void upload();
	void activeCallBack(UploadMessage msg, int curlErrorCode = 0);

private:
	string m_FileName;
	string m_FilePath;
	string m_UploadUrl;
	std::function<void()> m_callBack; //�ϴ����callBack
};

NS_CC_END;

#endif __UPLOADEREX_H_