#!/bin/bash

#### eg: mysql_to_hdfs_full.sh all

DATAX_HOME=/opt/software/datax
HDFS_BASE_DIR=/origin_data/apps/gmall/offline/db

# 如果传入日期则do_date等于传入的日期，否则等于前一天日期
if [ -n "$2" ]; then
  do_date=$2
else
  do_date=$(date -d "-1 day" +%F)
fi

#处理目标路径，此处的处理逻辑是，如果目标路径不存在，则创建；若存在，则清空，目的是保证同步任务可重复执行
handle_targetdir() {
  hadoop fs -test -e $1
  if [[ $? -eq 1 ]]; then
    echo "路径$1不存在，正在创建......"
    hadoop fs -mkdir -p $1
  else
    echo "路径$1已经存在"

  fi
}

#数据同步
import_data() {
  datax_config=$1
  target_dir=$2

  handle_targetdir $target_dir
  python $DATAX_HOME/bin/datax.py -p"-Dtargetdir=$target_dir" $datax_config
}

case $1 in
"activity_info")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.activity_info.json ${HDFS_BASE_DIR}/activity_info_full/$do_date
  ;;
"activity_rule")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.activity_rule.json ${HDFS_BASE_DIR}/activity_rule_full/$do_date
  ;;
"base_category1")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_category1.json ${HDFS_BASE_DIR}/base_category1_full/$do_date
  ;;
"base_category2")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_category2.json ${HDFS_BASE_DIR}/base_category2_full/$do_date
  ;;
"base_category3")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_category3.json ${HDFS_BASE_DIR}/base_category3_full/$do_date
  ;;
"base_dic")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_dic.json ${HDFS_BASE_DIR}/base_dic_full/$do_date
  ;;
"base_province")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_province.json ${HDFS_BASE_DIR}/base_province_full/$do_date
  ;;
"base_region")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_region.json ${HDFS_BASE_DIR}/base_region_full/$do_date
  ;;
"base_trademark")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_trademark.json ${HDFS_BASE_DIR}/base_trademark_full/$do_date
  ;;
"cart_info")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.cart_info.json ${HDFS_BASE_DIR}/cart_info_full/$do_date
  ;;
"coupon_info")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.coupon_info.json ${HDFS_BASE_DIR}/coupon_info_full/$do_date
  ;;
"sku_attr_value")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.sku_attr_value.json ${HDFS_BASE_DIR}/sku_attr_value_full/$do_date
  ;;
"sku_info")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.sku_info.json ${HDFS_BASE_DIR}/sku_info_full/$do_date
  ;;
"sku_sale_attr_value")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.sku_sale_attr_value.json ${HDFS_BASE_DIR}/sku_sale_attr_value_full/$do_date
  ;;
"spu_info")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.spu_info.json ${HDFS_BASE_DIR}/spu_info_full/$do_date
  ;;
"promotion_pos")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.promotion_pos.json ${HDFS_BASE_DIR}/promotion_pos_full/$do_date
  ;;
"promotion_refer")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.promotion_refer.json ${HDFS_BASE_DIR}/promotion_refer_full/$do_date
  ;;
"all")
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.activity_info.json ${HDFS_BASE_DIR}/activity_info_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.activity_rule.json ${HDFS_BASE_DIR}/activity_rule_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_category1.json ${HDFS_BASE_DIR}/base_category1_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_category2.json ${HDFS_BASE_DIR}/base_category2_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_category3.json ${HDFS_BASE_DIR}/base_category3_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_dic.json ${HDFS_BASE_DIR}/base_dic_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_province.json ${HDFS_BASE_DIR}/base_province_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_region.json ${HDFS_BASE_DIR}/base_region_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.base_trademark.json ${HDFS_BASE_DIR}/base_trademark_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.cart_info.json ${HDFS_BASE_DIR}/cart_info_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.coupon_info.json ${HDFS_BASE_DIR}/coupon_info_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.sku_attr_value.json ${HDFS_BASE_DIR}/sku_attr_value_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.sku_info.json ${HDFS_BASE_DIR}/sku_info_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.sku_sale_attr_value.json ${HDFS_BASE_DIR}/sku_sale_attr_value_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.spu_info.json ${HDFS_BASE_DIR}/spu_info_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.promotion_pos.json ${HDFS_BASE_DIR}/promotion_pos_full/$do_date
  import_data ${DATAX_HOME}/job/gmall/mysql_hdfs/gmall.promotion_refer.json ${HDFS_BASE_DIR}/promotion_refer_full/$do_date
  ;;
esac
