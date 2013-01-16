" Vim syntax file
" Language:         Wordpress Syntax Highlighting
" Maintainer:       Stefan Klopp
" Latest Revision:  22 May 2011
" Version:			0.1
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'wordpress'
endif

if version < 600
  unlet! wordpress_folding
  if exists("wordpress_sync_method") && !wordpress_sync_method
    let wordpress_sync_method=-1
  endif
  so <sfile>:p:h/php.vim
else
  runtime syntax/php.vim
  syn cluster phpClFunction  add=wpFunction
  unlet b:current_syntax
endif


" Following functions come from: http://codex.wordpress.org/Function_Reference
" Post, Page, Attachment and Bookmarks Functions
" Posts

syn keyword wpFunction get_adjacent_post get_boundary_post get_children get_extended  get_next_post get_permalink get_post get_post_ancestors get_post_mime_type get_post_status  get_post_type get_previous_post get_posts is_post is_single is_sticky  register_post_type wp_get_recent_posts wp_get_single_post contained

" Post insertion/removal

syn keyword wpFunction wp_delete_post wp_insert_post  wp_publish_post wp_update_post contained

" Pages

syn keyword wpFunction get_all_page_ids get_ancestors get_page  get_page_link get_page_by_path get_page_by_title get_page_children get_page_hierarchy get_page_uri  get_pages is_page page_uri_index wp_list_pages contained

" Custom field (postmeta)

syn keyword wpFunction add_post_meta  delete_post_meta get_post_custom get_post_custom_keys get_post_custom_values get_post_meta update_post_meta contained

" Attachments

syn keyword wpFunction get_attached_file is_attachment is_local_attachment update_attached_file wp_attachment_is_image  wp_insert_attachment wp_delete_attachment wp_get_attachment_image wp_get_attachment_link wp_get_attachment_image_src wp_get_attachment_metadata  wp_get_attachment_thumb_file wp_get_attachment_thumb_url wp_get_attachment_url wp_check_for_changed_slugs wp_count_posts wp_mime_type_icon  wp_update_attachment_metadata contained

" Bookmarks

syn keyword wpFunction get_bookmark get_bookmarks wp_list_bookmarks contained

" Terms

syn keyword wpFunction wp_get_post_categories wp_set_post_categories wp_get_post_tags wp_set_post_tags wp_get_post_terms  wp_set_post_terms contained

" Others

syn keyword wpFunction add_meta_box remove_meta_box get_the_ID  get_the_author get_the_content get_the_title wp_trim_excerpt contained

" Category, Tag and Taxonomy Functions
" Categories

syn keyword wpFunction cat_is_ancestor_of get_all_category_ids  get_ancestors get_cat_ID get_cat_name get_categories get_category get_category_by_path  get_category_by_slug  get_category_link get_category_parents get_the_category in_category is_category  wp_category_checklist wp_list_categories contained

" Category Creation

syn keyword wpFunction wp_create_category wp_delete_category wp_insert_category contained

" Tags

syn keyword wpFunction get_tag get_tag_link get_tags get_the_tag_list get_the_tags  is_tag contained

" Taxonomy

syn keyword wpFunction get_taxonomies get_term get_the_term_list get_term_by  get_the_terms get_term_children get_term_link get_terms is_taxonomy is_taxonomy_hierarchical  is_term taxonomy_exists term_exists register_taxonomy register_taxonomy_for_object_type wp_get_object_terms  wp_set_object_terms wp_insert_term wp_update_term wp_delete_term wp_terms_checklist contained

" User and Author Functions
" Admins, Roles and Capabilities
syn keyword wpFunction add_role author_can current_user_can current_user_can_for_blog get_role get_super_admins  is_super_admin map_meta_cap remove_role user_can contained

" Users and Authors

syn keyword wpFunction auth_redirect  count_users count_user_posts count_many_users_posts email_exists get_currentuserinfo get_profile  get_userdata get_userdatabylogin get_usernumposts get_users get_users_of_blog set_current_user  user_pass_ok username_exists validate_username wp_get_current_user wp_set_current_user  get_author_posts_url get_current_user_id get_user_by contained

" User meta

syn keyword wpFunction add_user_meta delete_user_meta get_user_meta update_user_meta contained

" User insertion/removal

syn keyword wpFunction wp_create_user wp_delete_user wp_insert_user wp_update_user contained

" Login / Logout

syn keyword wpFunction  is_user_logged_in wp_signon wp_logout contained

" Feed Functions
syn keyword wpFunction bloginfo_rss comment_author_rss comment_link  comment_text_rss do_feed do_feed_atom do_feed_rdf do_feed_rss do_feed_rss2  fetch_feed fetch_rss get_author_feed_link get_bloginfo_rss get_category_feed_link get_comment_link  get_comment_author_rss get_post_comments_feed_link get_rss get_search_comments_feed_link get_search_feed_link get_the_category_rss  get_the_title_rss permalink_single_rss post_comments_feed_link rss_enclosure the_title_rss the_category_rss  the_content_rss the_excerpt_rss wp_rss contained

" Comment, Ping, and Trackback Functions
syn keyword wpFunction add_ping check_comment discover_pingback_server_uri  do_all_pings do_enclose do_trackbacks generic_ping get_approved_comments get_avatar  get_comment get_comments get_enclosed get_lastcommentmodified get_pung get_to_ping  have_comments next_comments_link paginate_comments_links pingback previous_comments_link privacy_ping_filter  sanitize_comment_cookies is_trackback trackback trackback_url trackback_url_list weblog_ping  wp_allow_comment wp_count_comments wp_delete_comment wp_filter_comment wp_get_comment_status wp_get_current_commenter  wp_insert_comment wp_new_comment wp_set_comment_status wp_throttle_comment_flood wp_update_comment wp_update_comment_count contained

" Action, Filter, and Plugin Functions
" Filters

syn keyword wpFunction has_filter add_filter apply_filters current_filter merge_filters remove_filter  remove_all_filters contained

" Actions

syn keyword wpFunction has_action add_action do_action do_action_ref_array  did_action remove_action remove_all_actions contained

" Plugins

syn keyword wpFunction plugin_basename plugins_url  register_activation_hook register_deactivation_hook register_setting settings_fields unregister_setting contained

" Shortcodes

syn keyword wpFunction  add_shortcode do_shortcode do_shortcode_tag get_shortcode_regex remove_shortcode remove_all_shortcodes  shortcode_atts shortcode_parse_atts strip_shortcodes contained

" Theme-Related Functions
" Include functions

syn keyword wpFunction comments_template get_footer  get_header get_sidebar get_search_form contained
" Other functions

syn keyword wpFunction add_custom_background add_custom_image_header  add_theme_support current_theme_supports dynamic_sidebar get_404_template get_archive_template get_attachment_template  get_author_template get_category_template|get_category_template get_comments_popup_template get_current_theme get_date_template get_header_image  get_header_textcolor get_home_template get_locale_stylesheet_uri get_page_template get_paged_template get_query_template  get_search_template get_single_template get_stylesheet get_stylesheet_directory get_stylesheet_directory_uri get_stylesheet_uri  get_tag_template get_taxonomy_template get_template get_template_directory get_template_directory_uri get_template_part  get_theme get_theme_data get_theme_mod get_theme_root get_theme_root_uri get_themes  header_image header_textcolor load_template locale_stylesheet locate_template preview_theme  preview_theme_ob_filter preview_theme_ob_filter_callback register_nav_menu register_nav_menus register_theme_directory remove_theme_mod  remove_theme_mods require_if_theme_supports search_theme_directories set_theme_mod switch_theme validate_current_theme  unregister_nav_menu wp_get_nav_menu wp_get_nav_menu_items wp_nav_menu wp_page_menu contained

" Formatting Functions
syn keyword wpFunction add_magic_quotes addslashes_gpc  antispambot attribute_escape backslashit balanceTags clean_pre clean_url  convert_chars convert_smilies ent2ncr esc_attr esc_html esc_js  esc_textarea esc_url force_balance_tags format_to_edit format_to_post funky_javascript_fix  htmlentities2 is_email js_escape make_clickable popuplinks remove_accents  sanitize_email sanitize_file_name sanitize_user sanitize_title sanitize_title_with_dashes seems_utf8  stripslashes_deep trailingslashit untrailingslashit url_shorten utf8_uri_encode wpautop  wptexturize wp_filter_kses wp_filter_post_kses wp_filter_nohtml_kses wp_iso_descrambler wp_kses  wp_kses_array_lc wp_kses_attr wp_kses_bad_protocol wp_kses_bad_protocol_once wp_kses_bad_protocol_once2 wp_kses_check_attr_val  wp_kses_decode_entities wp_kses_hair wp_kses_hook wp_kses_html_error wp_kses_js_entities wp_kses_no_null  wp_kses_normalize_entities wp_kses_normalize_entities2 wp_kses_split wp_kses_split2 wp_kses_stripslashes wp_kses_version  wp_make_link_relative wp_rel_nofollow wp_richedit_pre wp_specialchars zeroise contained

" Miscellaneous Functions
" Time/Date Functions


syn keyword wpFunction current_time date_i18n get_calendar get_date_from_gmt get_lastpostdate get_lastpostmodified  get_day_link get_gmt_from_date get_month_link get_the_time get_weekstartend get_year_link  human_time_diff is_new_day iso8601_timezone_to_offset iso8601_to_datetime mysql2date contained

" Serialization


syn keyword wpFunction is_serialized is_serialized_string maybe_serialize maybe_unserialize contained

" Options


syn keyword wpFunction add_option delete_option form_option get_alloptions get_site_option get_user_option  get_option update_option update_user_option contained

" Form Helpers

syn keyword wpFunction checked disabled  selected contained

" Nonces and Referers (Security)

syn keyword wpFunction check_admin_referer check_ajax_referer wp_create_nonce wp_explain_nonce  wp_get_original_referer wp_get_referer wp_nonce_ays wp_nonce_field wp_nonce_url wp_original_referer_field  wp_referer_field wp_verify_nonce contained

" XMLRPC

syn keyword wpFunction xmlrpc_getpostcategory xmlrpc_getposttitle xmlrpc_removepostdata  user_pass_ok contained

" Localization

syn keyword wpFunction __ _e _ngettext _x  esc_attr__ esc_attr_e get_locale load_default_textdomain load_plugin_textdomain load_textdomain  load_theme_textdomain contained

" Cron (Scheduling)

syn keyword wpFunction spawn_cron wp_clear_scheduled_hook wp_cron wp_get_schedule  wp_get_schedules wp_next_scheduled wp_reschedule_event wp_schedule_event wp_schedule_single_event wp_unschedule_event contained

" Conditional Tags Index

syn keyword wpFunction comments_open has_nav_menu has_tag in_category  is_404 is_admin is_archive is_attachment is_author  is_category is_comments_popup is_date is_day is_feed  is_front_page is_home is_month is_page is_page_template  is_paged is_preview is_search is_single is_singular  is_sticky is_tag is_tax is_time is_trackback  is_year pings_open contained

" Miscellaneous

syn keyword wpFunction add_query_arg bool_from_yn  cache_javascript_headers do_robots get_bloginfo get_num_queries is_blog_installed is_main_site  is_ssl make_url_footnote nocache_headers remove_query_arg status_header wp  wp_check_filetype wp_clearcookie wp_die wp_footer wp_get_cookie_login wp_get_http_headers  wp_hash wp_head wp_mail wp_mkdir_p wp_new_user_notification wp_notify_moderator  wp_notify_postauthor wp_parse_args wp_redirect wp_remote_fopen wp_salt wp_set_auth_cookie  wp_upload_bits wp_upload_dir contained

" Classes
" WP - general request handling
syn keyword wpFunction WP_Ajax_Response WP_Object_Cache WP_Error contained

" Conditional Tags
syn keyword wpFunction WP_User_Query  WP_Rewrite WP_Roles WP_Role WP_User map_meta_cap current_user_can get_role add_role remove_role  wp_script_is wp_style_is  Walker Walker_Page Walker_PageDropdown Walker_Category Walker_CategoryDropdown wpdb remove_node  IXR_Value IXR_Message IXR_Server IXR_IntrospectionServer IXR_Request IXR_Client IXR_ClientMulticall IXR_Error IXR_Date IXR_Base64  Snoopy  PHP-gettext MagpieRSS RSSCache fetch_rss is_info is_success is_redirect is_error is_client_error is_server_error parse_w3cdtf wp_rss get_rss  POP3 StreamReader StringReader FileReader CachedFileReader contained

" Multisite functions

syn keyword wpFunction admin_notice_feed avoid_blog_page_permalink_collision check_import_new_users  check_upload_size choose_primary_blog confirm_delete_users dashboard_quota display_space_usage format_code_lang  get_site_allowed_themes get_space_allowed get_upload_space_available grant_super_admin is_upload_space_available ms_deprecated_blogs_file  mu_dropdown_languages new_user_email_admin_notice redirect_user_to_blog refresh_user_details revoke_super_admin secret_salt_warning  send_confirmation_on_profile_email show_post_thumbnail_warning site_admin_notice sync_category_tag_slugs update_option_new_admin_email update_user_status  upload_size_limit_filter upload_space_setting wpmu_delete_blog wpmu_delete_user wpmu_get_blog_allowedthemes _admin_notice_multisite_activate_plugins_page contained

" Multisite Functions

syn keyword wpFunction add_blog_option delete_blog_option get_blogaddress_by_domain get_blogaddress_by_id  get_blogaddress_by_name get_blog_details get_blog_option get_blog_status get_id_from_blogname get_last_updated  is_archived refresh_blog_details restore_current_blog switch_to_blog update_archived update_blog_details  update_blog_option update_blog_status wpmu_update_blogs_date   ms_cookie_constants ms_file_constants  ms_subdomain_constants ms_upload_constants   add_existing_user_to_blog add_new_user_to_blog add_user_to_blog  check_upload_mimes create_empty_blog domain_exists filter_SSL fix_import_form_size fix_phpmailer_messageid  force_ssl_content get_active_blog_for_user get_admin_users_for_domain get_blogs_of_user get_blog_count get_blog_id_from_url  get_blog_permalink get_blog_post get_current_site get_dashboard_blog get_dirsize get_most_recent_post_of_user  get_sitestats get_user_count get_user_id_from_string global_terms insert_blog install_blog  install_blog_defaults is_blog_user is_email_address_unsafe is_user_member_of_blog is_user_option_local is_user_spammy  maybe_add_existing_user_to_blog maybe_redirect_404 newblog_notify_siteadmin newuser_notify_siteadmin recurse_dirsize redirect_mu_dashboard  redirect_this_site remove_user_from_blog signup_nonce_check signup_nonce_fields update_blog_public update_posts_count  upload_is_file_too_big upload_is_user_over_quota users_can_register_signup_filter welcome_user_msg_filter wordpressmu_wp_mail_from wpmu_activate_signup  wpmu_admin_redirect_add_updated_param wpmu_create_blog wpmu_create_user wpmu_log_new_registrations wpmu_signup_blog wpmu_signup_blog_notification  wpmu_signup_user wpmu_signup_user_notification wpmu_validate_blog_signup wpmu_validate_user_signup wpmu_welcome_notification wpmu_welcome_user_notification  get_current_site_name is_subdomain_install ms_not_installed ms_site_check wpmu_current_site contained

" Other functions not found on: http://codex.wordpress.org/Function_Reference

syn keyword wpFunction register_sidebar get_query_var query_posts have_posts the_post post_class the_permalink the_post_thumbnail the_title_attribute get_continue_reading_link the_content wp_link_pages edit_post_link the_tags the_excerpt the_serach_query get_post_thumbnail_id get_intermediate_image_sizes path_join add_options_page wp_enqueue_script wp_register_style wp_enqueue_style wp_print_styles previous_post_link next_post_link the_title add_submenu_page get_edit_post_link number_format_i18n size_format wp_protect_special_option wp_load_alloptions wp_load_core_site_options	delete_transient get_transient set_transient wp_user_settings get_user_setting set_user_setting delete_user_setting get_all_user_settings wp_set_all_user_settings delete_all_user_settings wp_get_http wp_remote_request is_wp_error build_query wp_parse_str get_status_header_desc wp_get_nocache_headers wp_unique_filename wp_ext2type	wp_check_filetype_and_ext get_allowed_mime_types wp_parse_id_list wp_array_slice_assoc wp_filter_object_list wp_list_filter wp_list_pluck wp_maybe_load_embeds wp_maybe_load_widgets wp_widgets_add_menu wp_ob_end_flush_all dead_db absint url_is_accessable_via_ssl atom_service_url_filter validate_file add_site_option delete_site_option update_site_option delete_site_transient get_site_transient set_site_transient global_terms_enabled wp_scheduled_delete get_file_data has_post_format add_post_type_support wp_deregister_script wp_register_script wp_deregister_style get_headers site_url contained

hi link wpFunction Function

let b:current_syntax = "wordpress"

"hi def link wpFunction Type

if main_syntax == 'wordpress'
  unlet main_syntax
endif

" vim: ts=8 sts=2 sw=2 expandtab
