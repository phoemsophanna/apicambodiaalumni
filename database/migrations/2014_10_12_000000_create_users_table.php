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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('firstName')->nullable();
            $table->string('lastName')->nullable();
            $table->string('email')->nullable();
            $table->string('phoneNumber')->nullable();
            $table->string('image')->nullable();
            $table->string('password');
            $table->boolean('isSuperAdmin')->default(false);
            $table->boolean('isAdmin')->default(false);
            $table->boolean("isActive")->default(false);
            $table->timestamp("joinAt")->create_function();
            $table->double("totalDonation")->default(0.0);
            $table->integer("loginWith")->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
