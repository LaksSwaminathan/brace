view: application_details {

  derived_table: {
    explore_source: application {
      column: application_id {}
      column: number_of_coborrowers { field: borrower_to_loan_application.borrower_count }
      column: count { field: document.count }
      column: login_count { field: login.count }
    }
#     persist_for: "24 hours"
  }

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: application_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.application_id ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension: document_count {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: document_count_tier {
    type: tier
    style: integer
    tiers: [1,2,3,5]
    sql: ${document_count};;
  }

  dimension: has_logged_in {
    type: yesno
    sql: ${TABLE}.login_count > 0  ;;
  }

  dimension: number_of_coborrowers {
    type: number
    sql: ${TABLE}.number_of_coborrowers ;;
  }

###################################################################################################
#
#   MEASURES
#
###################################################################################################

  measure: average_document_upload {
    type: average
    sql: ${document_count} ;;
  }

###################################################################################################
#
#   SETS
#
###################################################################################################

  set: detail {
    fields: [application_id, document_count, number_of_coborrowers]
  }
}
