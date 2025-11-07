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
        Schema::create('news', function (Blueprint $table) {
            $table->id();
            $table->string("title")->nullable();
            $table->string("titleKh")->nullable();
            $table->text("summary")->nullable();
            $table->text("summaryKh")->nullable();
            $table->longText("content")->nullable();
            $table->longText("contentKh")->nullable();
            $table->boolean("isDisplayHomepage")->default(false);
            $table->string("image")->nullable();
            $table->string("type")->nullable();
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
        Schema::dropIfExists('news');
    }
};
