connection: "postgres_dev"

include: "views/*/*.view.lkml"                # include all views in the views/ folder in this project

label: "Borrower"

explore: application {
  label: "Application 📝"


  join: hardship {
    sql_on: ${application.application_id} = ${hardship.loan_application_id} ;;
    relationship: one_to_one
  }

  join: hardship_type {
    type: inner
    sql_on: ${hardship_type.hardship_type_id} = ${hardship.type_id} ;;
    relationship: many_to_one
  }

  join: document {
    type: left_outer
    sql_on: ${application.application_id} = ${document.application_id} ;;
    relationship: one_to_many
  }

  join: document_type {
    type: left_outer
    sql_on: ${document.document_type_id} = ${document_type.document_type_id} ;;
    relationship: many_to_one
  }

  join: disaster {
    from: disaster
    type: inner
    sql_on: ${disaster.disaster_id} = ${hardship.disaster_id} ;;
    relationship: many_to_one
  }

  join: loan {
    sql_on: ${application.loan_id} = ${loan.loan_id} ;;
    relationship: many_to_one
  }

  join: plaid_details {
    view_label: "Plaid Information"
    sql_on: ${application.application_id} = ${plaid_details.borrower_to_loan_application_id} ;;
    relationship: one_to_many
  }

  join: borrower_income {
    #filethis
    view_label: "FileThis Information"
    from: income
    sql_on: ${application.application_id} = ${borrower_income.borrower_to_loan_application_id} ;;
    relationship: one_to_many
  }

  join: borrower_to_loan_application {
    #hellosign, createdsign... form710_signature
    view_label: "HelloSign Information"
    sql_on: ${application.application_id} = ${borrower_to_loan_application.borrower_to_loan_application_id} ;;
    relationship: one_to_many
  }

  join: user {
    sql_on: ${loan.created_by} = ${user.user_id} ;;
    relationship: many_to_one
  }

  join: borrower {
    type: inner
    sql_on: ${borrower.user_id} = ${user.user_id}  ;;
    relationship: one_to_one
  }

  join: equifax_report {
    type: left_outer
    sql_on: ${equifax_report.borrower_id} = ${borrower.borrower_id} ;;
    relationship: one_to_many
  }

  ## Equifax -- credit.liability or credit.report (Count)
}

# explore: application_funnel {
#   from: application
#   join: hardship {
#     sql_on: ${application_funnel.application_id} = ${hardship.loan_application_id} ;;
#     relationship: one_to_one
#   }
#
#   join: hardship_type {
#     type: inner
#     sql_on: ${hardship_type.hardship_type_id} = ${hardship.type_id} ;;
#     relationship: many_to_one
#   }
# }
