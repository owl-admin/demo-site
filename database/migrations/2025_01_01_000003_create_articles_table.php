<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * 运行迁移
     */
    public function up(): void
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->default(0)->comment('用户ID');
            $table->string('title')->default('')->comment('标题');
            $table->text('content')->comment('内容');
            $table->integer('view')->comment('阅读量');
            $table->text('image')->comment('图片');
            $table->timestamps();
            $table->softDeletes();
            
            $table->index('title');
        });
    }

    /**
     * 回滚迁移
     */
    public function down(): void
    {
        Schema::dropIfExists('articles');
    }
};
