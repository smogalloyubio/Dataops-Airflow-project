snapshots:
  - name: snap_fact_orders
    description: "SCD Type 2 snapshot tracking changes on order rows."
    relation: ref('bronze_dim_fact_table')
    config:
      schema: snapshots
      unique_key: order_id
      strategy: check
      check_cols:
        - order_status_key
        - quantity
        - unit_price
        - discount_pct
        - shipping_fee
        - is_gift
      invalidate_hard_deletes: true