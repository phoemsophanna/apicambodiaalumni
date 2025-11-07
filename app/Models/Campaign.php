<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Campaign extends Model
{
    use HasFactory;
    protected $fillable = [
        "creatorId",
        "campaignCategoryId",
        "location",
        "city",
        "campaignTile",
        "campaignTileKm",
        "campaignTileCh",
        "fullStory",
        "fullStoryKm",
        "fullStoryCh",
        "additionalInformation",
        "additionalInformationKm",
        "additionalInformationCh",
        "involvement",
        "involvementKm",
        "involvementCh",
        "referenceLink",
        "goal",
        "startDate",
        "endDate",
        "gratitude",
        "gratitudeKm",
        "gratitudeCh",
        "campaignFor",
        "phoneNumber",
        "fullName",
        "documentType",
        "identityNumber",
        "creatorLocation",
        "creatorCity",
        "receiveByBank",
        "accountName",
        "accountNumber",
        "videoLink",
        "campaignGallery",
        "videoFile",
        "idCardBack",
        "idCardFront",
        "passport",
        "profile",
        "status",
        "ordering",
        "isActive",
        "isInNeed",
        "isTrending",
        "isLatest",
        "allowEdit",
        "qrCode",
        "balance",
        "totalWithdraw"
    ];
}
