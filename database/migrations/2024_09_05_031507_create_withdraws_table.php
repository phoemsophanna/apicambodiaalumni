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
        Schema::create('withdraws', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("campaignId");
            $table->bigInteger("requestBy");
            $table->bigInteger("approveBy")->nullable();
            $table->double("requestAmount");
            $table->string("accountName");
            $table->string("accountNumber");
            $table->string("withdrawStatus");
            $table->timestamp("requestDate");
            $table->timestamp("approveDate")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('withdraws');
    }
};
