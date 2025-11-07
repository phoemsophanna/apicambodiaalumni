<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    use HasFactory;
    protected $fillable = [
        "title",
        "titleKh",
        "titleCh",
        "subtitle",
        "subtitleKh",
        "subtitleCh",
        "description",
        "descriptionKh",
        "descriptionCh",
        "linkLabel",
        "linkLabelKh",
        "linkLabelCh",
        "linkTo",
        "redirectNewTap",
        "image",
        "ordering",
        "isActive",
    ];
}
