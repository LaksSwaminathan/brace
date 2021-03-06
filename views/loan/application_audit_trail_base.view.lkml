view: application_audit_trail_base {
  derived_table: {
    # datagroup_trigger: application_audit_dg
    sql:
    SELECT row_data -> 'application_id' AS application_id
        , action_tstamp_tx AS changed_date
        , row_data -> 'state' AS prior_state
        , changed_fields -> 'state' AS new_state
        , RANK() OVER (
            PARTITION BY row_data -> 'application_id' ORDER BY action_tstamp_tx
            ) AS record
    FROM audit.logged_actions
    WHERE table_name = 'application'
        AND action = 'U'
        AND changed_fields ? 'state'
    GROUP BY 1, 2, 3, 4;;
  }

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${application_id} || '_' || ${record} ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension: application_id {
    hidden: yes
    type: number
    sql: ${TABLE}.application_id ;;
  }

  dimension_group: changed {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.changed_date ;;
  }

  dimension: prior_state {
    type: string
    sql: ${TABLE}.prior_state ;;
  }

  dimension: new_state {
    type: string
    sql: ${TABLE}.new_state ;;
  }

  dimension: record {
    hidden: yes
    type: number
    sql: ${TABLE}.record ;;
  }
}
