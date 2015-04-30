#!/usr/bin/env bash
#这里uKey和_api_key分别是蒲公英平台可以获取
#apkname是选择上传相应渠道的名字
#uploadurl是固定，蒲公英上传APP的url
uKey=""
_api_key=""
apkname="*pgyer.apk"
uploadurl="http://www.pgyer.com/apiv1/app/upload"
echo "uKey=${uKey}"
echo "_api_key=${_api_key}"
echo "apkname=${apkname}"

apk_uri=$(echo ./build/outputs/apk/${apkname})

s=$(curl -F "uKey=${uKey}" -F "_api_key=${_api_key}" -F "file=@${apk_uri}" ${uploadurl})
echo $s > ./upload.log
code=$(echo $s | jq .code)

if [[ $code = 0 ]]; then
    echo "=================>上传成功<================="
else
    echo "=================<上传失败>================="
fi


