<?php

namespace App\Services;

use App\Models\Article;
use Illuminate\Support\Str;
use Slowlyo\OwlAdmin\Models\AdminUser;
use Slowlyo\OwlAdmin\Services\AdminService;

class ArticleService extends AdminService
{
    // 作用: 给 service 说明, 处理的事哪个模型的数据
    protected string $modelName = Article::class;

    /**
     * 用户列表 options
     */
    public function userOptions()
    {
        return AdminUser::where('enabled', 1)->get(['id as value', 'name as label']);
    }

    public function addRelations($query, string $scene = 'list')
    {
        if ($scene == 'detail') {
            // 详情页添加关联查询
            $query->with('user');
        }
    }

    public function searchable($query)
    {
        // 父级的搜索方法已经处理了模糊搜索
        parent::searchable($query);

        $userName = request('user_name');

        $query->when($userName, function ($query) use ($userName) {
            $query->whereHas('user', fn($q) => $q->where('name', 'like', like($userName)));
        });
    }

    public function sortable($query)
    {
        // 重写 sortable 并留空, 清除了原本的排序逻辑
    }

    // 保存前
    public function saving(&$data, $primaryKey = '')
    {
        // eg: 给标题拼接上时间戳
        $data['title'] = explode('-', $data['title'])[0];
        $data['title'] .= '-' . time();
    }

    // 保存后
    public function saved($model, $isEdit = false)
    {
        // eg: 给标题拼接上id
        $model->title = Str::of($model->title)->explode('~')->last();
        $model->title = $model->getKey() . '~' . $model->title;
        $model->save();
    }

    // 删除数据后
    public function deleted($ids)
    {
        admin_abort('数据删除成功, 但是我要给你一个错误提示 ┗( ▔, ▔ )┛');
    }
}
