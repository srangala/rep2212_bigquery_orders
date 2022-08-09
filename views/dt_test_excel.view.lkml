view: dt_test_excel {
    derived_table: {
      sql: SELECT
          "Account1" AS account_name, "UBER11111" AS policy_number, 278.40 AS downpayment, 0.00 AS premium, 0.00 AS taxes, 48.00 AS fees, 1091.32 AS total_billable_amount, "ch_3L1" AS stripe_transaction_reference, TIMESTAMP("2022-07-25T09:14:54.000+00:00") AS transaction_date, TIMESTAMP("2022-07-25T09:14:54.000+00:00") AS policy_start_date, TIMESTAMP("2023-07-25T09:14:54.000+00:00") AS policy_expiry_date
      UNION ALL
      SELECT
          "Account2" AS account_name, "UBER22222" AS policy_number, 233.89 AS downpayment, 898.72 AS premium, 193.13 AS taxes, 48.00 AS fees, 1133.85 AS total_billable_amount, "ch_3L2" AS stripe_transaction_reference, TIMESTAMP("2022-07-20T09:14:54.000+00:00") AS transaction_date, TIMESTAMP("2022-07-20T09:14:54.000+00:00") AS policy_start_date, TIMESTAMP("2023-07-20T09:14:54.000+00:00") AS policy_expiry_date
      UNION ALL
      SELECT
          "Account3" AS account_name, "UBER33333" AS policy_number, 0.00 AS downpayment, 0.00 AS premium, 0.00 AS taxes, 0.00 AS fees, 142.95 AS total_billable_amount, "ch_3L3" AS stripe_transaction_reference, TIMESTAMP("2022-07-01T09:14:54.000+00:00") AS transaction_date, TIMESTAMP("2022-07-01T09:14:54.000+00:00") AS policy_start_date, TIMESTAMP("2023-07-01T09:14:54.000+00:00") AS policy_expiry_date
      UNION ALL
      SELECT
          "Account4" AS account_name, "UBER44444" AS policy_number, 0.00 AS downpayment, 0.00 AS premium, 0.00 AS taxes, 0.00 AS fees, 142.95 AS total_billable_amount, "ch_3L4" AS stripe_transaction_reference, TIMESTAMP("2022-07-16T09:14:54.000+00:00") AS transaction_date, TIMESTAMP("2022-07-16T09:14:54.000+00:00") AS policy_start_date, TIMESTAMP("2023-07-16T09:14:54.000+00:00") AS policy_expiry_date
      UNION ALL
      SELECT
          "Account5" AS account_name, "UBER55555" AS policy_number, 197.43 AS downpayment, 0.00 AS premium, 0.00 AS taxes, 0.00 AS fees, 944.60 AS total_billable_amount, "ch_3L5" AS stripe_transaction_reference, TIMESTAMP("2022-07-07T09:14:54.000+00:00") AS transaction_date, TIMESTAMP("2022-07-07T09:14:54.000+00:00") AS policy_start_date, TIMESTAMP("2023-07-07T09:14:54.000+00:00") AS policy_expiry_date
      UNION ALL
      SELECT
          "Account6" AS account_name, "UBER66666" AS policy_number, 0.0 AS downpayment, 0.0 AS premium, 0.0 AS taxes, 0.0 AS fees, 142.95 AS total_billable_amount, "ch_3L6" AS stripe_transaction_reference, TIMESTAMP("2022-07-10T09:14:54.000+00:00") AS transaction_date, TIMESTAMP("2022-07-10T09:14:54.000+00:00") AS policy_start_date, TIMESTAMP("2023-07-10T09:14:54.000+00:00") AS policy_expiry_date
      UNION ALL
      SELECT
          "Account7" AS account_name, "UBER77777" AS policy_number, 297.16 AS downpayment, 0.0 AS premium, 0.0 AS taxes, 0.0 AS fees, 1513.46 AS total_billable_amount, "ch_3L7" AS stripe_transaction_reference, TIMESTAMP("2022-07-22T09:14:54.000+00:00") AS transaction_date, TIMESTAMP("2022-07-22T09:14:54.000+00:00") AS policy_start_date, TIMESTAMP("2023-07-22T09:14:54.000+00:00") AS policy_expiry_date
       ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: account_name {
      type: string
      sql: ${TABLE}.account_name ;;
      primary_key: yes
    }

    dimension: policy_number {
      type: string
      sql: ${TABLE}.policy_number ;;
    }

    dimension: downpayment {
      type: number
      sql: ${TABLE}.downpayment ;;
    }

    dimension: premium {
      type: number
      sql: ${TABLE}.premium ;;
    }

    dimension: taxes {
      type: number
      sql: ${TABLE}.taxes ;;
    }

    dimension: fees {
      type: number
      sql: ${TABLE}.fees ;;
    }

    dimension: total_billable_amount {
      type: number
      sql: ${TABLE}.total_billable_amount ;;
    }

    dimension: stripe_transaction_reference {
      type: string
      sql: ${TABLE}.stripe_transaction_reference ;;
    }

    dimension_group: transaction_date {
      type: time
      sql: ${TABLE}.transaction_date ;;
    }

    dimension_group: policy_start_date {
      type: time
      sql: ${TABLE}.policy_start_date ;;
    }

    dimension_group: policy_expiry_date {
      type: time
      sql: ${TABLE}.policy_expiry_date ;;
    }

    set: detail {
      fields: [
        account_name,
        policy_number,
        downpayment,
        premium,
        taxes,
        fees,
        total_billable_amount,
        stripe_transaction_reference,
        transaction_date_time,
        policy_start_date_time,
        policy_expiry_date_time
      ]
    }
  }
