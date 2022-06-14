{% macro get_show_grant_sql(relation) %}
{{ return(adapter.dispatch('get_show_grant_sql', 'dbt')(relation)) }}
{% endmacro %}

{% macro default__get_show_grant_sql(relation) %}
show grants on {{ relation.type }} {{ relation }}
{% endmacro %}

{% macro get_grant_sql(relation, grant_config) %}
{{ return(adapter.dispatch('get_grant_sql', 'dbt')(relation, grant_config)) }}
{% endmacro %}

{% macro default__get_grant_sql(relation, grant_config) %}
grant {{ privalage }} on {{ relation.type }} {{ relation }} to {{ recipients }}
{% endmacro %}

{% macro get_revoke_sql(relation, grant_config) %}
{{ return(adapter.dispatch('get_revoke_sql', 'dbt')(relation, grant_config)) }}
{% endmacro %}

{% macro default__get_revoke_sql(relation, grant_config) %}
{% endmacro %}

{% macro apply_grants(relation, grant_config, should_revoke) %}
{{ return(adapter.dispatch('apply_grant', 'dbt')(relation, grant_config, should_revoke)) }}
{% endmacro %}

{% macro default__apply_grants(revoke, relation, grant_config) %}
{% endmacro %}