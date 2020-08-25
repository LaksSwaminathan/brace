connection: "postgres_dev"

include: "views/*/*.view.lkml"                # include all views in the views/ folder in this project

label: "Borrower"

explore: application {
  label: "Application 📝"


  join: hardship {
    sql_on: ${application.application_id} = ${hardship.loan_application_id} ;;
    relationship: one_to_one
  }

  join: document {
    type: left_outer
    sql_on: ${application.application_id} = ${document.application_id} ;;
    relationship: one_to_many
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

  ## Equifax -- credit.liability or credit.report (Count)
}
