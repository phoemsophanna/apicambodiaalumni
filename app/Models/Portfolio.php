<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
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
        "location",
        "inProgress",
        "isDisplayHomepage",
        "ordering",
        "isActive",
    ];
}
