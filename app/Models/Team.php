<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    use HasFactory;
    protected $fillable = [
        "name",
        "nameKh",
        "nameCh",
        "position",
        "positionKh",
        "positionCh",
        "image",
        "desc",
        "descKh",
        "descCh",
        "facebookLink",
        "instagramLink",
        "linkedinLink",
        "telegramLink",
        "ordering",
        "isActive",
    ];
}
