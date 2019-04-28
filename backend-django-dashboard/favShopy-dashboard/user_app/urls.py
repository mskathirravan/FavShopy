from django.urls import path
from django.views.generic.base import TemplateView

from . import views

app_name = "user_app"
urlpatterns = [
    #path('test_login/',views.SqlHelper().test_login,name="test_login"),
    path('login/',views.login,name="login"),
    path('signup/',views.signup,name="signup"),
    # path('promtoions/', views.promtoions, name="promtoions"),
    path('dashboard/', views.dashboard, name="dashboard"),
    path('advertise/', views.advertise, name="advertise"),
    path('add_product/', views.add_product, name="add_product"),
    path('get_all_products/', views.get_all_products, name="get_all_products"),
    path('delete_all/', views.delete_all, name="delete_all"),
    # path('matchscreen/<slug:matchId>/', views.matchscreen, name='matchscreen'),
    path('logout/',views.logout,name="logout"),
    # path('get_sql_query/<slug:query_key>', views.SqlHelper().get_sql_query, name="sqlquery"),
    # path('notify_users/', views.SqlHelper().notify_users, name="notify_users"),
    # path('detailed_report/', views.SqlHelper().detailed_report, name="detailed_report"),
    # path('view_league/<slug:matchId>/', views.view_league, name="view_league"),
    # path('update_league_info/', views.update_league_info, name="update_league_info"),
    # path('state_wise_analytics/', views.SqlHelper().state_wise_analytics, name="state_wise_analytics"),
    # path('match_analytics/<slug:matchId>/', views.SqlHelper().match_analytics, name="match_analytics"),
    # path('mail_state_wise_analytics/', views.SqlHelper().mail_state_wise_analytics, name="mail_state_wise_analytics"),
    # path('mail_general_analytics/', views.SqlHelper().mail_general_analytics, name="mail_general_analytics"),
    # path('mail_analytics_link/', views.SqlHelper().mail_analytics_link, name="mail_analytics_link"),
    # path('<str:id>/<str:year>/', views.SqlHelper().user_statstics_by_year, name="user_statstics_by_year"),
    # path('<str:id>/<str:month>/<str:year>/', views.SqlHelper().user_statstics_by_month_year, name="user_statstics_by_month_year"),
]
