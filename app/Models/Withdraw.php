<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Withdraw extends Model
{
    use HasFactory;
    protected $fillable = [
        "campaignId",
        "requestBy",
        "approveBy",
        "requestAmount",
        "accountName",
        "accountNumber",
        "withdrawStatus",
        "requestDate",
        "approveDate"
    ];
}
