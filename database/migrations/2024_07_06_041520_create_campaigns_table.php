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
        Schema::create('campaigns', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("creatorId");
            $table->bigInteger("campaignCategoryId")->nullable();
            $table->string("location")->nullable();
            $table->string("city")->nullable();
            $table->string("campaignTile")->nullable();
            $table->string("campaignTileKm")->nullable();
            $table->text("fullStory")->nullable();
            $table->text("fullStoryKm")->nullable();
            $table->text("additionalInformation")->nullable();
            $table->text("additionalInformationKm")->nullable();
            $table->text("involvement")->nullable();
            $table->text("involvementKm")->nullable();
            $table->string("referenceLink")->nullable();
            $table->double("goal")->default(0.0);
            $table->date("startDate")->nullable();
            $table->date("endDate")->nullable();
            $table->text("gratitude")->nullable();
            $table->text("gratitudeKm")->nullable();
            $table->integer("campaignFor")->nullable();
            $table->string("phoneNumber")->nullable();
            $table->string("fullName")->nullable();
            $table->string("documentType")->nullable();
            $table->string("identityNumber")->nullable();
            $table->string("creatorLocation")->nullable();
            $table->string("creatorCity")->nullable();
            $table->string("receiveByBank")->nullable();
            $table->string("accountName")->nullable();
            $table->string("accountNumber")->nullable();
            $table->text("videoLink")->nullable();
            $table->json("campaignGallery");
            $table->text("videoFile")->nullable();
            $table->text("idCardBack")->nullable();
            $table->text("idCardFront")->nullable();
            $table->text("passport")->nullable();
            $table->text("profile")->nullable();
            $table->string("status")->nullable();
            $table->integer("ordering")->default(0);
            $table->boolean("isActive")->default(false);
            $table->timestamps();
            $table->boolean("isInNeed")->default(false);
            $table->boolean("isTrending")->default(false);
            $table->boolean("isLatest")->default(false);
            $table->double("totalTip")->default(0.0);
            $table->double("totalRaised")->default(0.0);
            $table->integer("totalDonation")->default(0);
            $table->integer("totalReaction")->default(0);
            $table->integer("totalShare")->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('campaigns');
    }
};
