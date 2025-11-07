<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserInformation extends Model
{
    use HasFactory;
    protected $table = 'user_informations';
    protected $fillable = [
        "user_id",
        "phone",
        "fullname",
        "gender",
        "age",
        "documentType",
        "idCardBack",
        "idCardFront",
        "identityNumber",
        "location",
        "passport",
        "profile",
        "city",
        "againstHumanity",
        "politicalUse",
        "date",
        "marital",
        "latinName",
        "education",
        "facebook",
        "birth",
        "identityDate",
        "job",
        "languages",
        "mother",
        "father",
        "placeBirth",
        "dayDo"
    ];
}
