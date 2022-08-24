view: dt_null_filter {
    derived_table: {
      sql: SELECT 1 AS order_item_id, 2 AS product_id
              UNION ALL
              SELECT 2 AS order_item_id, 1 AS product_id
              UNION ALL
              SELECT 3 AS order_item_id, null AS product_id
              UNION ALL
              SELECT 4 AS order_item_id, 3 AS product_id
              UNION ALL
              SELECT 5 AS order_item_id, null AS product_id
         ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: order_item_id {
      type: number
      sql: ${TABLE}.order_item_id ;;
      primary_key: yes
    }

    dimension: product_id {
      type: number
      sql: ${TABLE}.product_id ;;
    }

    set: detail {
      fields: [order_item_id, product_id]
    }
  }
