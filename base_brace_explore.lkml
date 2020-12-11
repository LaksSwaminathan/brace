# connection: ""
include: "views/*/*.view.lkml"                # include all views in the views/ folder in this project

include: "dashboards/*.dashboard"

label: "Borrower"

explore: application {
  label: "Application 📝"

  join: application_details {
    sql_on: ${application.application_id} = ${application_details.application_id} ;;
    relationship: one_to_one
  }

  join: application_audit_details {
    sql_on: ${application.application_id} = ${application_audit_details.application_id};;
    relationship: one_to_one
  }

  # application_audit_details

  join: hardship {
    sql_on: ${application.application_id} = ${hardship.loan_application_id} ;;
    relationship: one_to_one
    fields: [hardship.hardship_fields*]
  }

  join: hardship_type {
    view_label: "Hardship"
    sql_on: ${hardship_type.hardship_type_id} = ${hardship.type_id} ;;
    relationship: many_to_one
    fields: [hardship_type.hardship_type_fields*]
  }

  join: disaster {
    view_label: "Hardship"
    from: disaster
    sql_on: ${disaster.disaster_id} = ${hardship.disaster_id} ;;
    relationship: many_to_one
    fields: [disaster.diaster_fields*]
  }

  join: document {
    type: left_outer
    sql_on: ${application.application_id} = ${document.application_id} ;;
    relationship: one_to_many
    fields: [document.document_fields*, document.count]
  }

  join: document_type {
    view_label: "Document"
    type: left_outer
    sql_on: ${document.document_type_id} = ${document_type.document_type_id} ;;
    relationship: many_to_one
    fields: [document_type.document_type_fields*]
  }

  join: loan {
    sql_on: ${application.loan_id} = ${loan.loan_id} ;;
    relationship: many_to_one
  }

  join: plaid_details {
    view_label: "Vendor Information"
    sql_on: ${application.application_id} = ${plaid_details.borrower_to_loan_application_id} ;;
    relationship: one_to_many
    fields: [plaid_details.count, plaid_details.total_cost, plaid_details.created_date]
  }

  join: borrower_income {
    from: income
    sql_on: ${application.application_id} = ${borrower_income.borrower_to_loan_application_id} ;;
    relationship: one_to_many
  }

  # Getting User ID

  join: borrower_to_loan_application {
    view_label: "Borrower"
    sql_on: ${application.application_id} = ${borrower_to_loan_application.loan_application_id} ;;
    relationship: one_to_one
    fields: [borrower_to_loan_application.hellosign_fields*, borrower_to_loan_application.details*]
  }

  join: borrower {
    type: left_outer
    sql_on: ${borrower_to_loan_application.borrower_id} = ${borrower.borrower_id}  ;;
    relationship: many_to_one
  }

  join: user {
    view_label: "Borrower"
    sql_on: ${borrower.user_id} = ${user.user_id} ;;
    relationship: one_to_one
  }

  join: login {
    sql_on: ${user.user_id} = ${login.user_id} ;;
    relationship: one_to_many
    fields: []
  }

  join: equifax_report {
    view_label: "Vendor Information"
    type: left_outer
    sql_on: ${equifax_report.borrower_id} = ${borrower.borrower_id} ;;
    relationship: one_to_many
    fields: [equifax_report.number_of_completed_equifax_pulls]
  }

  ## Equifax -- credit.liability or credit.report (Count)
}

explore: servicer {
  view_name: application
  sql_always_where: ${user.role} <> 'BORROWER' ;;

  join: application_details {
    sql_on: ${application.application_id} = ${application_details.application_id} ;;
    relationship: one_to_one
  }

  join: application_details_recommended {
    view_label: "Application"
    sql_on: ${application.application_id} = ${application_details_recommended.application_id} ;;
    relationship: one_to_many
  }

  join: application_audit_details {
    sql_on: ${application.application_id} = ${application_audit_details.application_id};;
    relationship: one_to_one
  }

  join: borrower_to_loan_application {
    view_label: "Borrower"
    sql_on: ${application.application_id} = ${borrower_to_loan_application.loan_application_id} ;;
    relationship: one_to_one
    fields: [borrower_to_loan_application.hellosign_fields*, borrower_to_loan_application.details*]
  }

  join: user {
    view_label: "Servicer User"
    type: inner
    sql_on: ${user.user_id}=${application.created_by} ;;
    relationship: many_to_one
  }

  join: disaster {
    view_label: "Hardship"
    from: disaster
    sql_on: ${disaster.disaster_id} = ${hardship.disaster_id} ;;
    relationship: many_to_one
    fields: [disaster.diaster_fields*]
  }

  join: document {
    view_label: "Document"
    type: left_outer
    sql_on: ${application.application_id} = ${document.application_id} ;;
    relationship: one_to_many
    fields: [document.document_fields*, document.count]
  }

  join: document_type {
    view_label: "Document"
    type: left_outer
    sql_on: ${document.document_type_id} = ${document_type.document_type_id} ;;
    relationship: many_to_one
    fields: [document_type.document_type_fields*]
  }
  join: hardship {
    view_label: "Hardship"
    sql_on: ${application.application_id} = ${hardship.loan_application_id} ;;
    relationship: one_to_one
    fields: [hardship.hardship_fields*]
  }

  join: hardship_type {
    view_label: "Hardship"
    sql_on: ${hardship_type.hardship_type_id} = ${hardship.type_id} ;;
    relationship: many_to_one
    fields: [hardship_type.hardship_type_fields*]
  }

  join: loan {
    view_label: "Loan"
    sql_on: ${application.loan_id} = ${loan.loan_id} ;;
    relationship: many_to_one
  }

  join: workout {
    type: left_outer
    sql_on: ${application.application_id}= ${workout.loan_application_id} ;;
    relationship: many_to_one
  }

}

# explore: user {
#   join: login {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${user.user_id}=${login.user_id} ;;
#   }
# }


# explore: new_state {
#   from: application_audit_trail

#   join: old_state {
#     from: application_audit_trail
#     type: left_outer
#     sql_on: ${new_state.application_id}=${old_state.application_id} and ${new_state.record}-1 = ${old_state.record};;
#     relationship: many_to_many
#   }
# }





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
