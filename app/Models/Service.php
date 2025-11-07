<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;
    protected $fillable = [
        "title",
        "content",
        "titleKh",
        "contentKh",
        "image",
        "fromDate",
        "toDate",
        "inProgress",
        "isDisplayHomepage",
        "ordering",
        "isActive",
    ];
}
