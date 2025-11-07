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
        Schema::create('teams', function (Blueprint $table) {
            $table->id();
            $table->string("name")->nullable();
            $table->string("nameKh")->nullable();
            $table->text("desc")->nullable();
            $table->text("descKh")->nullable();
            $table->string("image")->nullable();
            $table->string("facebookLink")->nullable();
            $table->string("instagramLink")->nullable();
            $table->string("linkedinLink")->nullable();
            $table->string("telegramLink")->nullable();
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
        Schema::dropIfExists('teams');
    }
};
