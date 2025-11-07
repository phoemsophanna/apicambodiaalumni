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
        Schema::create('services', function (Blueprint $table) {
            $table->id();
            $table->string("title");
            $table->longText("content")->nullable();
            $table->string("image")->nullable();
            $table->bigInteger("category_id")->nullable();
            $table->string("client")->nullable();
            $table->date("fromDate")->nullable();
            $table->date("toDate")->nullable();
            $table->string("location")->nullable();
            $table->text("websiteLink")->nullable();
            $table->text("facebookLink")->nullable();
            $table->text("instagramLink")->nullable();
            $table->text("telegramLink")->nullable();
            $table->boolean("inProgress")->default(false);
            $table->boolean("isDisplayHomepage")->default(false);
            $table->integer("ordering")->default(0);
            $table->boolean("isActive")->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('services');
    }
};
