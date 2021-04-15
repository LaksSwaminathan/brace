view: application_details {

  derived_table: {
    sql:
      SELECT
        application.application_id  AS application_id,
        count(distinct(case when initcap(CAST(borrower_to_loan_application.last_completed_step AS VARCHAR)) not like 'Notstarted' then borrower_to_loan_application.borrower_id else null end)) as borrower_started_count,
        COUNT(DISTINCT (borrower_to_loan_application."borrower_id") ) AS number_of_coborrowers,
        COUNT(DISTINCT login."login_id" ) AS login_count
      FROM loan.application  AS application
      LEFT JOIN mapping.borrower_to_loan_application  AS borrower_to_loan_application ON application.application_id = (borrower_to_loan_application."loan_application_id")
      LEFT JOIN borrower.borrower  AS borrower ON (borrower_to_loan_application."borrower_id") = (borrower."borrower_id")
      LEFT JOIN auth."user"  AS "user" ON (borrower."user_id") = ("user"."user_id")
      LEFT JOIN auth.login  AS login ON ("user"."user_id") = (login."user_id")

      GROUP BY 1;;
  }

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: application_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.application_id ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  # dimension: document_count {
  #   type: number
  #   sql: ${TABLE}.count ;;
  # }

  dimension: borrower_started_count {
    type: number
    sql: ${TABLE}.borrower_started_count ;;
  }

  # dimension: document_count_tier {
  #   type: tier
  #   style: integer
  #   tiers: [1,2,3,5]
  #   sql: ${document_count};;
  # }

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

  # measure: average_document_upload {
  #   type: average
  #   sql: ${document_count} ;;
  # }

###################################################################################################
#
#   SETS
#
###################################################################################################

  set: detail {
    fields: [application_id, number_of_coborrowers]
  }
}
