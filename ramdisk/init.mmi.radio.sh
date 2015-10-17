#!/system/bin/sh
#

# Update the multisim config based on Radio version
radio=`getprop ro.boot.radio`

case $radio in
	"0x1") # xt1032 TODO: Differ with GPE
		setprop ro.product.device falcon_umts
 		setprop ro.build.description "falcon_retuglb-user 5.0.2 LXB22.99-36 35 release-keys"
		setprop ro.build.fingerprint motorola/falcon_retuglb/falcon_umts:5.0.2/LXB22.99-36/35:user/release-keys
		setprop ro.build.product falcon_umts
		setprop ro.mot.build.customerid retusa_glb
		setprop ro.telephony.default_network 0
		setprop persist.radio.multisim.config ""
		;;
	"0x3") # CDMA xt1031
		# TODO: Add cdma support (verizon xt1028)
 		setprop ro.product.device falcon_cdma
		setprop ro.build.description "falcon_boost-user 4.4.2 KXB20.9-1.10-1.18 18 release-keys"
 		setprop ro.build.fingerprint motorola/falcon_boost/falcon_cdma:4.4.2/KXB20.9-1.10-1.18/18:user/release-keys
 		setprop ro.build.product falcon_cdma
 		setprop persist.radio.multisim.config
 		setprop ro.mot.build.customerid sprint
 		setprop ro.cdma.home.operator.alpha "Boost Mobile"
 		setprop ro.cdma.home.operator.numeric 311870
		;;
		# CDMA Common
		setprop ro.telephony.default_network 4
		setprop ro.telephony.gsm-routes-us-smsc 1
		setprop persist.radio.vrte_logic 2
		setprop persist.radio.0x9e_not_callname 1
		setprop persist.radio.skip_data_check 1
		setprop persist.ril.max.crit.qmi.fails 4
		setprop ro.cdma.home.operator.isnan 1
		setprop ro.cdma.otaspnumschema SELC,1,80,99
		setprop ro.cdma.data_retry_config max_retries=infinite,0,0,10000,10000,100000,10000,10000,10000,10000,140000,540000,960000
		setprop ro.gsm.data_retry_config default_randomization=2000,max_retries=infinite,1000,1000,80000,125000,485000,905000
	"0x5") # Dual SIM xt1033
		setprop ro.product.device falcon_umtsds
 		setprop ro.build.description "falcon_retbr_ds-user 5.0.2 LXB22.46-28 27 release-keys"
		setprop ro.build.fingerprint motorola/falcon_retbr_ds/falcon_umtsds:5.0.2/LXB22.46-28/27:user/release-keys
		setprop ro.build.product falcon_umtsds
		setprop ro.mot.build.customerid RETBR
		setprop ro.telephony.default_network 0,1
		setprop persist.radio.multisim.config dsds
		setprop persist.radio.dont_use_dsd true
		setprop persist.radio.plmn_name_cmp 1
		;;
	"0x6") # Retail US xt1034
		setprop ro.product.device falcon_umts
 		setprop ro.build.description "falcon_retuaws-user 5.0.2 LXB22.99-36 19 release-keys"
		setprop ro.build.fingerprint motorola/falcon_retuaws/falcon_umts:5.0.2/LXB22.99-36/19:user/release-keys
		setprop ro.build.product falcon_umts
		setprop ro.mot.build.customerid retusa_aws
		setprop ro.telephony.default_network 0
		setprop persist.radio.multisim.config ""
		;;
esac
		setprop ro.product.model "Moto G"
