view: expenses {
  sql_table_name: loan.expenses ;;
  drill_fields: [expenses_id]

  dimension: expenses_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."expenses_id" ;;
  }

  dimension: association_dues_fees_amount {
    type: number
    sql: ${TABLE}."association_dues_fees_amount" ;;
  }

  dimension: association_dues_fees_amount_investment {
    type: number
    sql: ${TABLE}."association_dues_fees_amount_investment" ;;
  }

  dimension: association_dues_fees_amount_second_home {
    type: number
    sql: ${TABLE}."association_dues_fees_amount_second_home" ;;
  }

  dimension: attorney_fees_costs {
    type: number
    sql: ${TABLE}."attorney_fees_costs" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created" ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}."created_by" ;;
  }

  dimension: current_escrow_shortage_payment_amount {
    type: number
    sql: ${TABLE}."current_escrow_shortage_payment_amount" ;;
  }

  dimension: escrowed_association_dues_indicator {
    type: yesno
    sql: ${TABLE}."escrowed_association_dues_indicator" ;;
  }

  dimension: escrowed_flood_insurance_indicator {
    type: yesno
    sql: ${TABLE}."escrowed_flood_insurance_indicator" ;;
  }

  dimension: escrowed_hazard_insurance_indicator {
    type: yesno
    sql: ${TABLE}."escrowed_hazard_insurance_indicator" ;;
  }

  dimension: escrowed_property_tax_indicator {
    type: yesno
    sql: ${TABLE}."escrowed_property_tax_indicator" ;;
  }

  dimension: expenses_uuid {
    type: string
    sql: ${TABLE}."expenses_uuid" ;;
  }

  dimension: future_escrow_shortage_payment_amount {
    type: number
    sql: ${TABLE}."future_escrow_shortage_payment_amount" ;;
  }

  dimension: loan_escrow_advance_amount {
    type: number
    sql: ${TABLE}."loan_escrow_advance_amount" ;;
  }

  dimension: loan_pre_workout_principal_and_interest_payment_amount {
    type: number
    sql: ${TABLE}."loan_pre_workout_principal_and_interest_payment_amount" ;;
  }

  dimension: modification_fee_amount {
    type: number
    sql: ${TABLE}."modification_fee_amount" ;;
  }

  dimension: monthly_flood_insurance_amount {
    type: number
    sql: ${TABLE}."monthly_flood_insurance_amount" ;;
  }

  dimension: monthly_flood_insurance_amount_investment {
    type: number
    sql: ${TABLE}."monthly_flood_insurance_amount_investment" ;;
  }

  dimension: monthly_flood_insurance_amount_second_home {
    type: number
    sql: ${TABLE}."monthly_flood_insurance_amount_second_home" ;;
  }

  dimension: monthly_ground_rent_amount {
    type: number
    sql: ${TABLE}."monthly_ground_rent_amount" ;;
  }

  dimension: monthly_ground_rent_amount_investment {
    type: number
    sql: ${TABLE}."monthly_ground_rent_amount_investment" ;;
  }

  dimension: monthly_ground_rent_amount_second_home {
    type: number
    sql: ${TABLE}."monthly_ground_rent_amount_second_home" ;;
  }

  dimension: monthly_hazard_insurance_amount {
    type: number
    sql: ${TABLE}."monthly_hazard_insurance_amount" ;;
  }

  dimension: monthly_mortgage_insurance_amount {
    type: number
    sql: ${TABLE}."monthly_mortgage_insurance_amount" ;;
  }

  dimension: monthly_real_estate_tax_amount {
    type: number
    sql: ${TABLE}."monthly_real_estate_tax_amount" ;;
  }

  dimension: monthly_real_estate_tax_amount_investment {
    type: number
    sql: ${TABLE}."monthly_real_estate_tax_amount_investment" ;;
  }

  dimension: monthly_real_estate_tax_amount_second_home {
    type: number
    sql: ${TABLE}."monthly_real_estate_tax_amount_second_home" ;;
  }

  dimension: other_advances_for_capitalization {
    type: number
    sql: ${TABLE}."other_advances_for_capitalization" ;;
  }

  dimension: pre_workout_principal_and_interest_payment_amount_investment {
    type: number
    sql: ${TABLE}."pre_workout_principal_and_interest_payment_amount_investment" ;;
  }

  dimension: pre_workout_principal_and_interest_payment_amount_second_home {
    type: number
    sql: ${TABLE}."pre_workout_principal_and_interest_payment_amount_second_home" ;;
  }

  dimension: projected_escrow_shortage_payment_amount {
    type: number
    sql: ${TABLE}."projected_escrow_shortage_payment_amount" ;;
  }

  dimension: projected_escrow_shortage_payment_amount_investment {
    type: number
    sql: ${TABLE}."projected_escrow_shortage_payment_amount_investment" ;;
  }

  dimension: projected_escrow_shortage_payment_amount_second_home {
    type: number
    sql: ${TABLE}."projected_escrow_shortage_payment_amount_second_home" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."updated" ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}."updated_by" ;;
  }

  measure: count {
    type: count
    drill_fields: [expenses_id, application.count]
  }
}
