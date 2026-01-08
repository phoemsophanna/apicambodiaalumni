<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Donation extends Model
{
    use HasFactory;
    protected $fillable = [
        "campaignId",
        "donorId",
        "donateType",
        "amount",
        "tip",
        "total",
        "paymentMethod",
        "note",
        "isConfirmAgreement",
        "donationDate"
    ];

    public function campaign() {
        return $this->belongsTo(Campaign::class, "campaignId", "id");
    }
}
