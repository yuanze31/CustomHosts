ui_print "- by | $MODAUTH"
hosts=$(ls /data/adb/modules/*/system/etc/hosts | grep -v "$MODID")
if [ -n "$hosts" ]; then
	ui_print "安装失败！存在其它hosts模块，请关闭或卸载重启后再安装。"
	ui_print "↓下列为存在冲突的hosts模块ID。↓"
	ui_print "↓请关闭或卸载上述模块ID对应的模块。↓"
	ui_print "如果不知道此模块ID是那个模块名称，请前往路径/data/adb/modules/模块ID，内查看(module.prop)，后关闭或卸载该模块。"
	abort "$hosts"
else
	ui_print "正在安装：$MODNAME"
fi
set_perm_recursive $MODPATH 0 0 0755 0644
