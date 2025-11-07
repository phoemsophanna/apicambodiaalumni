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
        Schema::create('banners', function (Blueprint $table) {
            $table->id();
            $table->string("title")->nullable();
            $table->string("titleKh")->nullable();
            $table->string("subtitle")->nullable();
            $table->string("subtitleKh")->nullable();
            $table->text("description")->nullable();
            $table->text("descriptionKh")->nullable();
            $table->string("image")->nullable();
            $table->string("linkLabel")->nullable();
            $table->string("linkLabelKh")->nullable();
            $table->text("linkTo")->nullable();
            $table->boolean("redirectNewTap")->default(false);
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
        Schema::dropIfExists('banners');
    }
};
