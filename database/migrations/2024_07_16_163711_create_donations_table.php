<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('donations', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("campaignId");
            $table->bigInteger("donorId")->nullable();
            $table->string("donateType")->nullable();
            $table->double("amount")->default(0);
            $table->double("tip")->default(0);
            $table->double("total")->default(0);
            $table->string("paymentMethod")->nullable();
            $table->text("note")->nullable();
            $table->boolean("isConfirmAgreement")->default(false);
            $table->dateTime("donationDate")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('donations');
    }
};
