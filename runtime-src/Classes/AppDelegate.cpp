#include "AppDelegate.h"
#include "CCLuaEngine.h"
#include "SimpleAudioEngine.h"
#include "cocos2d.h"
#if (CC_TARGET_PLATFORM != CC_PLATFORM_WP8)
#include "CodeIDESupport.h"
#include "Runtime.h"
#endif
#include "ConfigParser.h"
#include "lua_module_register.h"


// extra lua module
#include "cocos2dx_extra.h"
#include "lua_extensions/lua_extensions_more.h"
#include "luabinding/lua_cocos2dx_extension_filter_auto.hpp"
#include "luabinding/lua_cocos2dx_extension_nanovg_auto.hpp"
#include "luabinding/lua_cocos2dx_extension_nanovg_manual.hpp"
#include "luabinding/cocos2dx_extra_luabinding.h"
#include "luabinding/HelperFunc_luabinding.h"
#include "luabinding/lua_myclass_auto.hpp"
#include "luabinding/lua_myclass_spriteHue_auto.hpp"
#include "2dEffect/lua_myclass_effect2D_auto.hpp"
#include "luabinding/lua_myclass_downloader_auto.hpp"
#include "luabinding/lua_myclass_uploader_auto.hpp"
#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
#include "luabinding/cocos2dx_extra_ios_iap_luabinding.h"
#endif
#if ANYSDK_DEFINE > 0
#include "anysdkbindings.h"
#include "anysdk_manual_bindings.h"
#endif

// bugly导入头文件
#if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
#include "bugly/CrashReport.h"
#include "bugly/lua/BuglyLuaAgent.h"
#elif (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
#include "CrashReport.h"
#include "BuglyLuaAgent.h"
#endif

//呀呀语音
//#include "YVTool.h"

using namespace CocosDenshion;

USING_NS_CC;
using namespace std;

//=========================云娃SDK事件Dispatch类==================================
class DispatchMsgNode : public cocos2d::Node
{
public:
    bool init()
    {
        isschedule = false;
        return  Node::init();
    }
    CREATE_FUNC(DispatchMsgNode);
    void startDispatch()
    {
        if (isschedule) return;
        isschedule = true;
        Director::getInstance()->getScheduler()->scheduleUpdate(this, 0, false);
    }
    void stopDispatch()
    {
        if (!isschedule) return;
        isschedule = false;
        Director::getInstance()->getScheduler()->unscheduleUpdate(this);
    }
    void update(float dt)
    {
        //YVSDK::YVTool::getInstance()->dispatchMsg(dt);
    }
private:
    bool isschedule;
    
};
//========================================================================================

static void quick_module_register(lua_State *L)
{
    luaopen_lua_extensions_more(L);
    
    lua_getglobal(L, "_G");
    if (lua_istable(L, -1))//stack:...,_G,
    {
        register_all_quick_manual(L);
        // extra
        luaopen_cocos2dx_extra_luabinding(L);
        register_all_cocos2dx_extension_filter(L);
        register_all_cocos2dx_extension_nanovg(L);
        register_all_cocos2dx_extension_nanovg_manual(L);
        luaopen_HelperFunc_luabinding(L);
#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
        luaopen_cocos2dx_extra_ios_iap_luabinding(L);
#endif
    }
    lua_pop(L, 1);
}

//
AppDelegate::AppDelegate()
:_launchMode(0)
{
    m_dispathMsgNode = NULL;
}

AppDelegate::~AppDelegate()
{
    //    SimpleAudioEngine::end();
    
    if (m_dispathMsgNode != NULL)
    {
        m_dispathMsgNode->stopDispatch();
        m_dispathMsgNode->release();
        m_dispathMsgNode = NULL;
    }
    
#if CC_TARGET_PLATFORM == CC_PLATFORM_WIN32
    endRuntime();
#elif (COCOS2D_DEBUG > 0 && CC_CODE_IDE_DEBUG_SUPPORT > 0)
    // NOTE:Please don't remove this call if you want to debug with Cocos Code IDE
    if (_launchMode)
    {
        endRuntime();
    }
#endif
    
    ConfigParser::purge();
}

//if you want a different context,just modify the value of glContextAttrs
//it will takes effect on all platforms
void AppDelegate::initGLContextAttrs()
{
    //set OpenGL context attributions,now can only set six attributions:
    //red,green,blue,alpha,depth,stencil
    GLContextAttrs glContextAttrs = { 8, 8, 8, 8, 24, 8 };
    
    GLView::setGLContextAttrs(glContextAttrs);
}

bool AppDelegate::applicationDidFinishLaunching()
{
#if CC_TARGET_PLATFORM == CC_PLATFORM_WIN32
    initRuntime();
#elif (COCOS2D_DEBUG > 0 && CC_CODE_IDE_DEBUG_SUPPORT > 0)
    // NOTE:Please don't remove this call if you want to debug with Cocos Code IDE
    if (_launchMode)
    {
        initRuntime();
    }
#endif
    
    // initialize director
    auto director = Director::getInstance();
    auto glview = director->getOpenGLView();
    if(!glview) {
        Size viewSize = ConfigParser::getInstance()->getInitViewSize();
        string title = ConfigParser::getInstance()->getInitViewName();
#if (CC_TARGET_PLATFORM == CC_PLATFORM_WIN32 || CC_TARGET_PLATFORM == CC_PLATFORM_MAC)
        extern void createSimulator(const char* viewName, float width, float height, bool isLandscape = true, float frameZoomFactor = 1.0f);
        bool isLanscape = ConfigParser::getInstance()->isLanscape();
        createSimulator(title.c_str(),viewSize.width,viewSize.height, isLanscape);
#else
        glview = cocos2d::GLViewImpl::createWithRect(title.c_str(), Rect(0, 0, viewSize.width, viewSize.height));
        if (viewSize.width < viewSize.height )
            glview = cocos2d::GLViewImpl::createWithRect(title.c_str(), Rect(0, 0, viewSize.height, viewSize.width));
        director->setOpenGLView(glview);
#endif
        director->startAnimation();
    }
    
    
	   std::string writablePath = FileUtils::getInstance()->getWritablePath();
    std::string storagePath = writablePath+"new_version" ;
    std::string  storagePathSrc = writablePath+"new_version/src";
    std::string  storagePathRes = writablePath+"new_version/res" ;
    FileUtils::getInstance()->addSearchPath(storagePath);
    FileUtils::getInstance()->addSearchPath(storagePathRes);
    FileUtils::getInstance()->addSearchPath(storagePathSrc);
    
    
    FileUtils::getInstance()->addSearchPath("res");
    FileUtils::getInstance()->addSearchPath("src");
    
    
    auto engine = LuaEngine::getInstance();


    register_all_myclass_downloader(engine->getLuaStack()->getLuaState());
	register_all_myclass_uploader(engine->getLuaStack()->getLuaState());
    register_all_myclass(engine->getLuaStack()->getLuaState());
    register_all_myclass_effect2D(engine->getLuaStack()->getLuaState());
	
    ScriptEngineManager::getInstance()->setScriptEngine(engine);
    lua_State* L = engine->getLuaStack()->getLuaState();
    lua_module_register(L);
    
    // use Quick-Cocos2d-X
    quick_module_register(L);
    
    LuaStack* stack = engine->getLuaStack();
#if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
    //bugly init
    CrashReport::initCrashReport("900052301", false);
    
    // register lua exception handler with lua engine
    BuglyLuaAgent::registerLuaExceptionHandler(engine);
#elif (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    //bugly init
    CrashReport::initCrashReport("46db76fff9", false);
    
    // register lua exception handler with lua engine
    BuglyLuaAgent::registerLuaExceptionHandler(engine);

	//lua 加密
	stack->setXXTEAKeyAndSign("yileKey20150225", strlen("yileKey20150225"), "yileSign20150225", strlen("yileSign20150225"));

#endif
#if ANYSDK_DEFINE > 0
    lua_getglobal(stack->getLuaState(), "_G");
    tolua_anysdk_open(stack->getLuaState());
    tolua_anysdk_manual_open(stack->getLuaState());
    lua_pop(stack->getLuaState(), 1);
#endif
    
    // stack->setXXTEAKeyAndSign("2dxLua", strlen("2dxLua"), "XXTEA", strlen("XXTEA"));
    
    //register custom function
    //LuaStack* stack = engine->getLuaStack();
    //register_custom_function(stack->getLuaState());
    
#if (COCOS2D_DEBUG > 0 && CC_CODE_IDE_DEBUG_SUPPORT > 0)
    // NOTE:Please don't remove this call if you want to debug with Cocos Code IDE
    if (_launchMode)
    {
        startRuntime();
    }
    else
    {
        engine->executeScriptFile(ConfigParser::getInstance()->getEntryFile().c_str());
        
        //stack->executeString("require 'main'");
    }
#else
    // stack->executeString("require 'main'");
    engine->executeScriptFile(ConfigParser::getInstance()->getEntryFile().c_str());
#endif
    
    m_dispathMsgNode = DispatchMsgNode::create();
    m_dispathMsgNode->retain();
    m_dispathMsgNode->startDispatch();
    
    return true;
}

// This function will be called when the app is inactive. When comes a phone call,it's be invoked too
void AppDelegate::applicationDidEnterBackground()
{
    Director::getInstance()->stopAnimation();
    Director::getInstance()->pause();
    
    //SimpleAudioEngine::getInstance()->pauseBackgroundMusic();
    //SimpleAudioEngine::getInstance()->pauseAllEffects();
    
    Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("APP_ENTER_BACKGROUND_EVENT");
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground()
{
    Director::getInstance()->resume();
    Director::getInstance()->startAnimation();
    
    //SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
    //SimpleAudioEngine::getInstance()->resumeAllEffects();
    
    Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("APP_ENTER_FOREGROUND_EVENT");
}

void AppDelegate::setLaunchMode(int mode)
{
    _launchMode = mode;
}

extern "C"
{
    
#if defined (__unix) || (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
#ifndef __ENABLE_COMPATIBILITY_WITH_UNIX_2003__
#define __ENABLE_COMPATIBILITY_WITH_UNIX_2003__
#include <stdio.h>
#include <dirent.h>
    //    FILE *fopen$UNIX2003( const char *filename, const char *mode )
    //    {
    //        return fopen(filename, mode);
    //    }
    //    size_t fwrite$UNIX2003( const void *a, size_t b, size_t c, FILE *d )
    //    {
    //        return fwrite(a, b, c, d);
    //    }
    //    char *strerror$UNIX2003( int errnum )
    //    {
    //        
    //        return strerror(errnum);
    //    }
    
    
    DIR *opendir$INODE64(const char * a)
    {
        return opendir(a);
    }
    
    
    struct dirent *readdir$INODE64(DIR *dir)
    {
        return readdir(dir);
    }
    
    
#endif
#endif//</dirent.h></stdio.h>
}
