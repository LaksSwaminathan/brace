connection: "postgres_dev"

include: "views/*/*.view.lkml"                # include all views in the views/ folder in this project


explore: application {
  label: "Borrower Application"

  join: hardship {
    sql_on: ${application.application_id} = ${hardship.loan_application_id} ;;
    relationship: one_to_one
  }

  join: loan {
    sql_on: ${application.loan_id} = ${loan.loan_id} ;;
    relationship: many_to_one
  }

  join: plaid_details {
    sql_on: ${application.application_id} = ${plaid_details.borrower_to_loan_application_id} ;;
    relationship: many_to_one
  }

  join: user {
    sql_on: ${loan.created_by} = ${user.user_id} ;;
    relationship: many_to_one
  }
}
