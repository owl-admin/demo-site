<?php

namespace App\Models;

use Slowlyo\OwlAdmin\Models\BaseModel;
use Slowlyo\OwlAdmin\Models\AdminUser;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Casts\Attribute;

// \Slowlyo\OwlAdmin\Models\BaseModel 中处理了时间格式以及数据库连接
class Article extends BaseModel
{
    // 软删除
    use SoftDeletes;

    // Doc:  https://doc.owladmin.com/#/faq/file-handle
    public function image(): Attribute
    {
        return file_upload_handle();
    }

    public function user()
    {
        return $this->belongsTo(AdminUser::class, 'user_id')->select(['id', 'name']);
    }
}
