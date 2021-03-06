#!/bin/bash

# Copyright 2017 MSO4SC - javier.carnero@atos.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
CKAN_CONFIG_FILE="${CKAN_CONFIG}/ckan.ini"

# Add plugin to ckan config
sed -i -e 's|ckan.plugins =|ckan.plugins = oauth2|g' $CKAN_CONFIG_FILE
sed -i -e 's|## Search Settings|## OAuth2 configuration\
\
ckan.oauth2.logout_url = /user/logged_out\
ckan.oauth2.register_url = https://account.lab.fiware.org/users/sign_up\
ckan.oauth2.reset_url = https://account.lab.fiware.org/users/password/new\
ckan.oauth2.edit_url = https://account.lab.fiware.org/settings\
ckan.oauth2.authorization_endpoint = https://account.lab.fiware.org/oauth2/authorize\
ckan.oauth2.token_endpoint = https://account.lab.fiware.org/oauth2/token\
ckan.oauth2.profile_api_url = https://account.lab.fiware.org/user\
ckan.oauth2.client_id = ID\
ckan.oauth2.client_secret = SECRET\
ckan.oauth2.scope = all_info\
ckan.oauth2.rememberer_name = auth_tkt\
ckan.oauth2.profile_api_user_field = id\
ckan.oauth2.profile_api_fullname_field = displayName\
ckan.oauth2.profile_api_mail_field = email\
ckan.oauth2.authorization_header = Bearer\
\
\
## Search Settings|g' $CKAN_CONFIG_FILE