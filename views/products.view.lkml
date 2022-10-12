view: products {
  sql_table_name: `orders.products`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: brand_test {
    type: string
    sql: concat("[", ${brand} ,"]|a");;
    html: {% assign split_value = value | split: '|' %}
    {{ split_value[0] | replace: "[", "<strong>" | replace: "]", "</strong>"}};;
  }

  dimension: brand_test_2 {
    type: string
    sql: concat("[", ${brand} ,"]|a");;
    html: {% assign split_value = value | split: '|' %} pre test
      <strong>{{ split_value[0] | replace: "[", "" | replace: "]", ""}} </strong> post test;;
  }

dimension: test1 {
  sql: "[Hannah Cloutier] is meeting productivity goals but has a Productivity Efficiency of less than 90%. Increasing efficiency can help gain back personal time.|" ;;

}
  dimension: test2 {
    sql: "[Albino Hernandez Esperon's] Focus Efficiency is less than 35% and is missing the goal by 1 hrs/day. [Slack] is the top application/site affecting Focus.|" ;;

  }
  dimension: test3 {
    sql: "[Hannah Cloutier] is meeting productivity goals but has a Productivity Efficiency of less than 90%. Increasing efficiency can help gain back personal time." ;;

  }
  dimension: test4 {
    sql: "[Albino Hernandez Esperon's] Focus Efficiency is less than 35% and is missing the goal by 1 hrs/day. [Slack] is the top application/site affecting Focus." ;;

  }

  dimension: coaching_opportunity_work_efficency_1 {
    type: string
    label: "Coaching Opportunity 1"
    #cpandey on 02-14-2022 Removing {{ }} around value split_value = {{value}} for AC-12937
    # html: {% assign split_value = value | split: '|' %}
    #   {{ split_value[0] | replace: "[", "<strong>" | replace: "]", "</strong>"}};;
    ##html suggestion from Looker support start

    html: {% assign split_value = value | split: '|' %}
    {% assign split_value1 = split_value[0] | split: '[' %}
        {% assign split_value2 = split_value1[1] | split: ']' %}
  {{split_value1[0]}}
  <strong> {{ split_value2 | slice: 0 }} </strong>
  {{ split_value2 | slice: 1 }};;

    ##html suggestion from Looker support end

    #link: {
    #  label: "Work Efficiency"
    #  #cpandey on 02-14-2022 Removing {{ }} around value split_value = {{value}} for AC-12937
    #  url: "{% if value != 'You don’t have any opportunities to review at this moment. Opportunities are refreshed every Monday.'and _user_attributes['activtrak_role_access'] contains 'Insights-WorkEfficiency'%} {% assign split_value = value | split: '|' %}/embed/dashboards/@{work_efficiency_overview_dashboard_id}?Team={{ _filters['user_group.team_or_null_filter'] | url_encode }}&Activity+Date={{ split_value[1] | url_encode }}{% endif %}"
    #}

      sql: ${test2} ;;
      #sql: COALESCE(CONCAT(${TABLE}.brand," [square_brackets_text] xyz. [square_brackets_text2] abc |",${category}," to ",${item_name}),${TABLE}.brand) ;;

      #sql: COALESCE(CONCAT(${TABLE}.brand," [square_brackets_text] xyz |",${category}," to ",${item_name}),${TABLE}.brand) ;;
    }

  dimension: coaching_opportunity_work_efficency_2 {
    type: string
    label: "Coaching Opportunity 2"
    #cpandey on 02-14-2022 Removing {{ }} around value split_value = {{value}} for AC-12937
    # html: {% assign split_value = value | split: '|' %}
    #   {{ split_value[0] | replace: "[", "<strong>" | replace: "]", "</strong>"}};;
    ##html suggestion from Looker support start
    html: {% assign split_value = value | split: '|' %}
          {% assign split_value1 = split_value[0] | split: '[' %}

          {% assign split_value2 = split_value1[1] | split: ']' %}

          {% assign split_value3 = split_value2 | slice: 0 %}
          {% assign split_value4 = split_value2 | slice: 1 %}

          {{split_value1 | slice: 0 }}
          <strong> {{ split_value3[0] }} </strong>
          {{ split_value4[0] }}
        ;;

    ##html suggestion from Looker support end

    #link: {
    #  label: "Work Efficiency"
    #  #cpandey on 02-14-2022 Removing {{ }} around value split_value = {{value}} for AC-12937
    #  url: "{% if value != 'You don’t have any opportunities to review at this moment. Opportunities are refreshed every Monday.'and _user_attributes['activtrak_role_access'] contains 'Insights-WorkEfficiency'%} {% assign split_value = value | split: '|' %}/embed/dashboards/@{work_efficiency_overview_dashboard_id}?Team={{ _filters['user_group.team_or_null_filter'] | url_encode }}&Activity+Date={{ split_value[1] | url_encode }}{% endif %}"
    #}
    sql: COALESCE(CONCAT(${TABLE}.brand," square_brackets_text xyz |",${category}," to ",${item_name}),${TABLE}.brand) ;;

    #sql: COALESCE(CONCAT(${TABLE}.brand," [square_brackets_text] xyz |",${category}," to ",${item_name}),${TABLE}.brand) ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count, product_sheets.count]
  }
}
