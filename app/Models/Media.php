<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Media extends Model
{
    use HasFactory;

    protected $fillable = [
        'parent_type',
        'parent_id',
        'file_path',
        'caption',
        'is_default',
    ];

    /**
     * Get the parent model (service, project, etc.)
     */
    public function parent()
    {
        return $this->morphTo();
    }
}