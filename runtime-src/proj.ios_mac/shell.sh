#创建：夏痕 QQ：2324236837
#! /bin/bash
# created by Ficow Shen

#工程绝对路径
project_path=/Users/mac/Documents/GongChengSanGuo/SanGuoBaYe/frameworks/runtime-src/proj.ios_mac
#工程文件路径
proj_path=${project_path}/RourthEute.xcodeproj
#打包模式 Debug/Release
development_mode=Release
#scheme名
scheme_name=RourthEute
#build文件夹路径
build_path=${project_path}/build

echo "请选择是否重新清理和编译工程 注：首次必选1 【1.YES  其他.NO 】"
##
read number
if [ $number = 1 ];
then
echo '*** 正在清除build ***'
cd ${project_path}
ls
rm -r -f build
echo '*** 已经清除build ***'
echo '*** 正在 清理工程 ***'
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild \
clean -project ${proj_path} -configuration ${development_mode} -alltargets
echo '*** 清理完成 ***'

echo '*** 正在 编译工程 For '${development_mode}
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild \
archive -project ${proj_path} -scheme ${scheme_name} -configuration Release -archivePath ${build_path}/game.xcarchive
echo '*** 编译完成 ***'

echo "请选择打包模式 【1.development/测试包 2.spp-store/发布包 其它.退出】"
##
read number
#while([[ $number != 11 ]] && [[ $number != 22 ]] && [[ $number != 0 ]])
#do
#echo "错误! 必须选择 11 or 22 or 0"
#echo "请选择打包模式 【11.development/测试包 22.spp-store/发布包】"
#read number
#done
if [ $number = 1 ];
then
#plist文件所在路径
exportOptionsPlistPath=${project_path}/exportTest_dev.plist
#导出.ipa文件所在路径
exportFilePath=${project_path}/IPA_dev
echo '*** 正在清除IPA_dev ***'
cd ${project_path}
ls
rm -r -f IPA_dev
echo '*** 已经清除IPA_dev ***'
echo '*** 正在 打包 ***'
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild \
-exportArchive -archivePath ${build_path}/game.xcarchive -exportOptionsPlist ${exportOptionsPlistPath} -exportPath ${exportFilePath}
    if [ -e $exportFilePath/$scheme_name.ipa ];
    then
    echo "*** dev.ipa文件已导出 ***"
    open $exportFilePath
    else
    echo "*** 创建 dev.ipa文件失败 ***"
    fi
echo '*** 指令结束 ***'
fi


if [ $number = 2 ];
then
#plist文件所在路径
exportOptionsPlistPath=${project_path}/exportTest_dis.plist
#导出.ipa文件所在路径
exportFilePath=${project_path}/IPA_dis
echo '*** 正在清除IPA_dis ***'
cd ${project_path}
ls
rm -r -f IPA_dis
echo '*** 已经清除IPA_dis ***'
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild \
-exportArchive -archivePath ${build_path}/game.xcarchive -exportOptionsPlist ${exportOptionsPlistPath} -exportPath ${exportFilePath}
    if [ -e $exportFilePath/$scheme_name.ipa ];
    then
    echo "*** dis.ipa文件已导出 ***"
    open $exportFilePath
    else
    echo "*** 创建 dis.ipa文件失败 ***"
    fi
echo '*** 指令结束 ***'
fi

else

echo "请选择打包模式 【1.development/测试包 2.spp-store/发布包 其它.退出】"
##
read number
#while([[ $number != 11 ]] && [[ $number != 22 ]] && [[ $number != 0 ]])
#do
#echo "错误! 必须选择 11 or 22 or 0"
#echo "请选择打包模式 【11.development/测试包 22.spp-store/发布包】"
#read number
#done
if [ $number = 1 ];
then
#plist文件所在路径
exportOptionsPlistPath=${project_path}/exportTest_dev.plist
#导出.ipa文件所在路径
exportFilePath=${project_path}/IPA_dev
echo '*** 正在清除IPA_dev ***'
cd ${project_path}
ls
rm -r -f IPA_dev
echo '*** 已经清除IPA_dev ***'
echo '*** 正在 打包 ***'
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild \
-exportArchive -archivePath ${build_path}/game.xcarchive -exportOptionsPlist ${exportOptionsPlistPath} -exportPath ${exportFilePath}
    if [ -e $exportFilePath/$scheme_name.ipa ];
    then
    echo "*** dev.ipa文件已导出 ***"
    open $exportFilePath
    else
    echo "*** 创建 dev.ipa文件失败 ***"
    fi
echo '*** 指令结束 ***'
fi

if [ $number = 2 ];
then
#plist文件所在路径
exportOptionsPlistPath=${project_path}/exportTest_dis.plist
#导出.ipa文件所在路径
exportFilePath=${project_path}/IPA_dis
echo '*** 正在清除IPA_dis ***'
cd ${project_path}
ls
rm -r -f IPA_dis
echo '*** 已经清除IPA_dis ***'
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild \
-exportArchive -archivePath ${build_path}/game.xcarchive -exportOptionsPlist ${exportOptionsPlistPath} -exportPath ${exportFilePath}
    if [ -e $exportFilePath/$scheme_name.ipa ]; then
    echo "*** dis.ipa文件已导出 ***"
    open $exportFilePath
    else
    echo "*** 创建 dis.ipa文件失败 ***"
    fi
echo '*** 指令结束 ***'
fi
fi
exit 0
