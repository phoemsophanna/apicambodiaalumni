<?php

use App\Http\Controllers as API;
use App\Http\Controllers\AdminController as Admin;
use App\Http\Controllers\Website as Website;
use App\Http\Controllers\AdminController\CampaignCategoryController;
use App\Http\Controllers\FileStorageController;
use App\Http\Controllers\Website\Dashboard\CampaignController;
use App\Http\Controllers\Website\DonationController;
use App\Http\Controllers\Website\WebPageController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function () {
    Route::post('/login', [API\AuthController::class, 'login']);
    Route::post('/login-web', [API\AuthController::class, 'loginWeb']);
    Route::post('/register', [API\AuthController::class, 'register']);
    Route::post('/register-web', [API\AuthController::class, 'registerWeb']);
    Route::post('/google-auth', [API\AuthController::class, 'googleAuth']);
    Route::post('/logout', [API\AuthController::class, 'logout']);
    Route::post('/logout-web', [API\AuthController::class, 'logoutWeb']);
    Route::get('/user-profile', [API\AuthController::class, 'userProfile']);
    Route::get('/user-information', [API\AuthController::class, 'userInformation']);
    Route::put('/update-user', [API\AuthController::class, 'updateUser']);
    Route::put('/change-password', [API\AuthController::class, 'changeAuth']);
    Route::post('/send-phone-code', [API\AuthController::class, 'sendPhonNumberVerifyCode']);
    Route::post('/send-code', [API\AuthController::class, 'sendEmailVerifyCode']);
    Route::post('/verify-code', [API\AuthController::class, 'getEmailVerifyCode']);
    Route::post('/verify-phone-code', [API\AuthController::class, 'verifyPhoneCode']);
    Route::post("/change-user-info", [API\AuthController::class, "changeUserInfo"]);
    Route::post("/check-account", [API\AuthController::class, "findUserAccountIsExited"]);
    Route::post("/forget-pass", [API\AuthController::class, "changePassword"]);
});
Route::group(['middleware' => 'api', 'prefix' => 'dashboard'], function () {
    Route::get("/", [Admin\DashboardController::class, "index"]);
});
Route::group(['middleware' => 'api', 'prefix' => 'users'], function () {
    Route::get("/", [API\UserController::class, "index"]);
    Route::post("/", [API\UserController::class, "store"]);
    Route::get("/detail", [API\UserController::class, "show"]);
    Route::delete("/delete/{id}", [API\UserController::class, "destroy"]);
});
Route::group(['middleware' => 'api', 'prefix' => 'members'], function () {
    Route::get("/", [Admin\MemberController::class, "index"]);
    Route::post("/", [Admin\MemberController::class, "store"]);
    Route::get("/detail", [Admin\MemberController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\MemberController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'member-informations'], function () {
    Route::get("/", [Admin\MemberInformationController::class, "index"]);
    Route::post("/", [Admin\MemberInformationController::class, "store"]);
    Route::get("/detail", [Admin\MemberInformationController::class, "show"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'performances'], function () {
    Route::get("/", [Admin\PerformanceController::class, "index"]);
    Route::post("/", [Admin\PerformanceController::class, "store"]);
    Route::get("/detail", [Admin\PerformanceController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\PerformanceController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'news'], function () {
    Route::get("/", [Admin\NewsController::class, "index"]);
    Route::post("/", [Admin\NewsController::class, "store"]);
    Route::get("/detail", [Admin\NewsController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\NewsController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'campaign-categories'], function () {
    Route::get("/", [Admin\CampaignCategoryController::class, "index"]);
    Route::post("/", [Admin\CampaignCategoryController::class, "store"]);
    Route::get("/detail", [Admin\CampaignCategoryController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\CampaignCategoryController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'galleries'], function () {
    Route::get("/", [Admin\GalleryController::class, "index"]);
    Route::post("/", [Admin\GalleryController::class, "store"]);
    Route::get("/detail", [Admin\GalleryController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\GalleryController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'video'], function () {
    Route::get("/", [Admin\VideoController::class, "index"]);
    Route::post("/", [Admin\VideoController::class, "store"]);
    Route::get("/detail", [Admin\VideoController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\VideoController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'teams'], function () {
    Route::get("/", [Admin\TeamController::class, "index"]);
    Route::post("/", [Admin\TeamController::class, "store"]);
    Route::get("/detail", [Admin\TeamController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\TeamController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'projects'], function () {
    Route::get("/", [Admin\ProjectController::class, "index"]);
    Route::post("/", [Admin\ProjectController::class, "store"]);
    Route::get("/detail", [Admin\ProjectController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\ProjectController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'services'], function () {
    Route::get("/", [Admin\ServiceController::class, "index"]);
    Route::post("/", [Admin\ServiceController::class, "store"]);
    Route::get("/detail", [Admin\ServiceController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\ServiceController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'portfolios'], function () {
    Route::get("/", [Admin\PortfolioController::class, "index"]);
    Route::post("/", [Admin\PortfolioController::class, "store"]);
    Route::get("/detail", [Admin\PortfolioController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\PortfolioController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'campaigns'], function () {
    Route::get("/", [Admin\CampaignController::class, "index"]);
    Route::post("/", [Admin\CampaignController::class, "store"]);
    Route::get("/detail", [Admin\CampaignController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\CampaignController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'withdraws'], function () {
    Route::get("/", [Admin\WithdrawController::class, "index"]);
    Route::post("/", [Admin\WithdrawController::class, "store"]);
    Route::get("/detail", [Admin\WithdrawController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\WithdrawController::class, "destroy"]);
});


Route::group(['middleware' => 'api', 'prefix' => 'testimonials'], function () {
    Route::get("/", [Admin\TestimonialController::class, "index"]);
    Route::post("/", [Admin\TestimonialController::class, "store"]);
    Route::get("/detail", [Admin\TestimonialController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\TestimonialController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'technologies'], function () {
    Route::get("/", [Admin\TechnologyController::class, "index"]);
    Route::post("/", [Admin\TechnologyController::class, "store"]);
    Route::get("/detail", [Admin\TechnologyController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\TechnologyController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'partners'], function () {
    Route::get("/", [Admin\PartnerController::class, "index"]);
    Route::post("/", [Admin\PartnerController::class, "store"]);
    Route::get("/detail", [Admin\PartnerController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\PartnerController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'banners'], function () {
    Route::get("/", [Admin\BannerController::class, "index"]);
    Route::post("/", [Admin\BannerController::class, "store"]);
    Route::get("/detail", [Admin\BannerController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\BannerController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'page-banners'], function () {
    Route::get("/", [Admin\PageBannerController::class, "index"]);
    Route::post("/", [Admin\PageBannerController::class, "store"]);
    Route::get("/detail", [Admin\PageBannerController::class, "show"]);
    Route::delete("/delete/{id}", [Admin\PageBannerController::class, "destroy"]);
});

Route::group(['middleware' => 'api', 'prefix' => 'site-setting'], function () {
    Route::post('/', [Admin\SiteSettingController::class, 'onSave']);
    Route::get('/{type}', [Admin\SiteSettingController::class, 'index']);
});

Route::post("/save-image/{dir}", [FileStorageController::class, "uploadImage"]);
Route::post("/save-content-image", [FileStorageController::class, "uploadContent"]);
Route::delete("/save-image/{dir}", [FileStorageController::class, "deleteImage"]);
Route::get("/save-image/{dir}", [FileStorageController::class, "previewImage"]);


// Website Public
Route::prefix('/web')->group(function () {
    Route::get("/feed-list", [Website\FeedController::class, "index"]);
    Route::get("/services", [Website\ServiceController::class, "index"]);
    Route::get("/gallery", [Website\ActivitiesController::class, "gallery"]);
    Route::get("/video", [Website\ActivitiesController::class, "video"]);
    Route::get("/services/{id}", [Website\ServiceController::class, 'detail']);
    Route::get("/portfolios", [Website\PortfolioController::class, "index"]);
    Route::get("/portfolios/{id}", [Website\PortfolioController::class, 'detail']);
    Route::get("/members", [Website\WebPageController::class, "memberFetch"]);
    Route::get("/how-it-work", [Website\WebPageController::class, "howItWork"]);
    Route::get("/search", [Website\WebPageController::class, "search"]);
    Route::group(["prefix" => "donation"], function() {
        Route::post("/", [DonationController::class, "donation"]);
        Route::get("/donor-list", [DonationController::class, "donationList"]);
        Route::get("/list-all-donations", [DonationController::class, "listAllDonations"]);
        Route::get("/list-top-donations", [DonationController::class, "topDonation"]);
    });
    Route::group(["prefix" => "campaign"], function() {
        Route::get("/dropdown", [Website\CampaignController::class, "dropdown"]);
        Route::get("/home", [Website\CampaignController::class, "homeCampaign"]);
        Route::get("/getMainCampaign", [Website\CampaignController::class, "getMainCampaign"]);
        Route::get("/project", [Website\CampaignController::class, "projectCampaign"]);
        Route::get("/project-id-paths", [Website\CampaignController::class, "projectCampaignIdPaths"]);
        Route::get("/project/{id}", [Website\CampaignController::class, "campaignDetail"]);
        Route::get("/project-meta/{id}", [Website\CampaignController::class, "campaignDetailMeta"]);
        Route::get("/donor-list/{campaignId}", [Website\CampaignController::class, "getAllDonorByCampaign"]);
        Route::get("/comment-list/{campaignId}", [Website\CampaignController::class, "getCampaignComment"]);
        Route::get("/generate-qr-code/{campaignId}", [Website\CampaignController::class, "generateQRCode"]);
        Route::get("/view-qr-code", [Website\CampaignController::class, "viewSvgFile"]);
        Route::group(['middleware' => 'api', 'prefix' => 'user'], function () {
            Route::post('/share', [Website\CampaignController::class, 'userShareCampaign']);
            Route::post('/comment', [Website\CampaignController::class, 'userComment']);
            Route::post('/like', [Website\CampaignController::class, 'userLikeCampaign']);
            Route::get('/user-like', [Website\CampaignController::class, 'userIsLikeCampaign']);
             Route::post('/application', [Website\CampaignController::class, 'userApplicationForm']);
        });
    });
    Route::group(["prefix" => "home"], function () {
        Route::get("/slider", [Website\HomepageController::class, "slider"]);
        Route::get("/categories", [Website\HomepageController::class, "getCategories"]);
        Route::get("/news-event", [Website\HomepageController::class, "newsEvent"]);
        Route::get("/partner", [Website\HomepageController::class, "partners"]);
        Route::get("/", [Website\HomepageController::class, "homepage"]);
    });
    Route::group(["prefix" => "news"], function() {
        Route::get("/", [Website\NewsController::class, "newsEvents"]);
        Route::get("/list-related", [Website\NewsController::class, "listRelated"]);
        Route::get("/{id}", [Website\NewsController::class, "detail"]);
    });
    Route::group(["prefix" => "about"], function () {
        Route::get("/", [Website\AboutUsController::class, "aboutPage"]);
        Route::get("/teams", [Website\AboutUsController::class, "teamList"]);
    });
    Route::group(["prefix" => "contact"], function () {
        Route::get("/", [Website\ContactController::class, "contactPage"]);
        Route::post("/send-email", [Website\ContactController::class, "sendingEmail"]);
    });
    Route::get("/term-condition", [Website\TermConditionController::class, "termConditionPage"]);
    Route::get("/donation-term", [Website\TermConditionController::class, "termDonationPage"]);
    Route::get("/privacy-policy", [Website\PrivacyPolicyController::class, "privacyPolicyPage"]);
    Route::get("/page-banner", [Website\WebPageController::class, "pageBanner"]);
});

Route::post("/sending-email", [WebPageController::class, "sendingEmail"]);

// Website Private
// User Dashboard
Route::get("/category-dropdown", [CampaignController::class, "getDropdown"]);
Route::group(['middleware' => 'api', 'prefix' => 'campaign-web'], function () {
    Route::get("/", [CampaignController::class, "index"]);
    Route::post("/", [CampaignController::class, "store"]);
    Route::get("/detail", [CampaignController::class, "show"]);
    Route::delete("/delete/{id}", [CampaignController::class, "destroy"]);
});
Route::group(['middleware' => 'auth:api', 'prefix' => 'withdraw'], function () {
    Route::post("/", [Website\Dashboard\WithdrawController::class, "requestWithdraw"]);
    Route::get("/histories", [Website\Dashboard\WithdrawController::class, "index"]);
});
