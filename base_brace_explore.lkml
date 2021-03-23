# connection: ""
include: "views/*/*.view.lkml"                # include all views in the views/ folder in this project

include: "dashboards/*.dashboard"

explore: application {
  label: "Application 📝"
  fields: [ALL_FIELDS*, -application.count_option_recommended]

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

  # join: document {
  #   type: left_outer
  #   sql_on: ${application.application_id} = ${document.application_id} ;;
  #   relationship: one_to_many
  #   fields: [document.document_fields*, document.count]
  # }

  # join: document_type {
  #   view_label: "Document"
  #   type: left_outer
  #   sql_on: ${document.document_type_id} = ${document_type.document_type_id} ;;
  #   relationship: many_to_one
  #   fields: [document_type.document_type_fields*]
  # }

  join: loan {
    sql_on: ${application.loan_id} = ${loan.loan_id} ;;
    relationship: many_to_one
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

  join: plaid_details {
    view_label: "Vendor Information"
    sql_on: ${borrower_to_loan_application.borrower_to_loan_application_id} = ${plaid_details.borrower_to_loan_application_id} ;;
    relationship: one_to_many
    fields: [plaid_details.count, plaid_details.total_cost, plaid_details.created_date]
  }

  join: equifax_report {
    view_label: "Vendor Information"
    type: left_outer
    sql_on: ${equifax_report.borrower_id} = ${borrower.borrower_id} ;;
    relationship: one_to_many
    fields: [equifax_report.number_of_completed_equifax_pulls]
  }
}

explore: servicer {
  view_name: application

  join: application_details {
    type: inner
    sql_on: ${application.application_id} = ${application_details.application_id} ;;
    relationship: one_to_one
  }

  join: application_details_recommended {
    view_label: "Application"
    type: left_outer
    sql_on: ${application.application_id} = ${application_details_recommended.application_id} ;;
    relationship: one_to_many
  }

  join: application_audit_details {
    view_label: "Application"
    type: inner
    sql_on: ${application.application_id} = ${application_audit_details.application_id};;
    relationship: one_to_one
  }

  join: application_audit_trail {
    view_label: "Application"
    type: left_outer
    relationship: one_to_many
    sql_on: ${application.application_id}::BIGINT = ${application_audit_trail.application_id}::BIGINT ;;
  }

  join: borrower_to_loan_application {
    view_label: "Borrower"
    type: left_outer
    sql_on: ${application.application_id} = ${borrower_to_loan_application.loan_application_id} ;;
    relationship: one_to_one
    fields: [borrower_to_loan_application.hellosign_fields*, borrower_to_loan_application.details*]
  }

  join: servicer_user_to_application {
    type: left_outer
    relationship: many_to_many
    sql_on: ${application.application_id}=${servicer_user_to_application.application_id}
      AND ${application.state}=${servicer_user_to_application.application_state};;
  }

  join: servicer_user {
    from: user
    view_label: "Servicer User"
    type: left_outer
    sql_on: ${servicer_user.user_id}=${servicer_user_to_application.user_id} ;;
    relationship: many_to_one
  }

  join: disaster {
    view_label: "Hardship"
    from: disaster
    type: left_outer
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
    type: left_outer
    sql_on: ${application.application_id} = ${hardship.loan_application_id} ;;
    relationship: one_to_one
    fields: [hardship.hardship_fields*]
  }

  join: hardship_type {
    view_label: "Hardship"
    type: left_outer
    sql_on: ${hardship_type.hardship_type_id} = ${hardship.type_id} ;;
    relationship: many_to_one
    fields: [hardship_type.hardship_type_fields*]
  }

  join: loan {
    view_label: "Loan"
    type: left_outer
    sql_on: ${application.loan_id} = ${loan.loan_id} ;;
    relationship: many_to_one
  }

  join: workout {
    type: left_outer
    sql_on: ${application.application_id}= ${workout.loan_application_id} and ${application.state} IN ('Option_Recommended', 'Completed') ;;
    relationship: many_to_one
  }

  join: workout_history {
    type: inner
    relationship: one_to_many
    sql_on: ${workout_history.workout_id} = ${workout.workout_id} ;;
  }

  join: workout_type {
    view_label: "Workout"
    type: inner
    relationship: many_to_one
    sql_on: ${workout.workout_type_id} = ${workout_type.workout_type_id} ;;
    fields: [workout_type.servicer_set*]
  }

  join: workout_state {
    view_label: "Workout History"
    type: inner
    relationship: many_to_one
    sql_on: ${workout_history.workout_state_id} = ${workout_state.workout_state_id};;
    fields: [workout_state.servicer_set*]
  }
}

explore: user {
  hidden: yes
  join: login {
    type: inner
    relationship: one_to_many
    sql_on: ${user.user_id}=${login.user_id};;
  }
}
