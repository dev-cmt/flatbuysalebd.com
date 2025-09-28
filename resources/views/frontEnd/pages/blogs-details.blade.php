@extends('frontEnd.layouts.app')
@section('title', $post->title ?? 'Blog Detail')

@section('breadcrumb')
<!-- Page Title -->
<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                
                <h2 class="ipt-title">{{ $post->title }}</h2>
                <span class="ipn-subtitle">{{ $post->category->category_name ?? '' }}</span>
                
            </div>
        </div>
    </div>
</div>
@endsection

@section('content')

<section class="gray-simple">
    <div class="container">
        <div class="row">

            <!-- Blog Detail -->
            <div class="col-lg-8 col-md-12 col-sm-12 col-12">
                <div class="blog-details single-post-item format-standard">
                    <div class="post-details">

                        {{-- Featured Image --}}
                        @if($post->image_path)
                        <div class="post-featured-img">
                            <img class="img-fluid" src="{{ asset($post->image_path) }}" alt="{{ $post->title }}">
                        </div>
                        @endif

                        {{-- Meta --}}
                        <div class="post-top-meta">
                            <ul class="meta-comment-tag">
                                <li>
                                    <a href="#">
                                        <span class="icons"><i class="ti-user"></i></span>
                                        by {{ $post->author->name ?? 'Admin' }}
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="icons"><i class="ti-comment-alt"></i></span>
                                        {{ $post->comments->count() }} Comments
                                    </a>
                                </li>
                            </ul>
                        </div>

                        {{-- Title & Content --}}
                        <h2 class="post-title">{{ $post->title }}</h2>
                        <div class="post-content">{!! $post->content !!}</div>

                        {{-- Tags + Social Share --}}
                        <div class="post-bottom-meta">
                            @if($post->tags->count())
                            <div class="post-tags">
                                <h4 class="pbm-title">Related Tags</h4>
                                <ul class="list">
                                    @foreach($post->tags as $tag)
                                        <li><a href="{{ route('page.blogs-tag', $tag->slug) }}">{{ $tag->name }}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            <div class="post-share">
                                <h4 class="pbm-title">Social Share</h4>
                                <ul class="list">
                                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                    <li><a href="#"><i class="fab fa-vk"></i></a></li>
                                    <li><a href="#"><i class="fab fa-tumblr"></i></a></li>
                                </ul>
                            </div>
                        </div>

                        {{-- Prev / Next Post Links --}}
                        <div class="single-post-pagination">
                            @if($previousPost)
                                <div class="prev-post">
                                    <a href="{{ route('page.blogs-details', $previousPost->slug) }}">
                                        <div class="title-with-link">
                                            <span class="intro">Prev Post</span>
                                            <h3 class="title">{{ $previousPost->title }}</h3>
                                        </div>
                                    </a>
                                </div>
                            @endif

                            <div class="post-pagination-center-grid">
                                <a href="{{ route('page.blogs') }}"><i class="ti-layout-grid3"></i></a>
                            </div>

                            @if($nextPost)
                                <div class="next-post">
                                    <a href="{{ route('page.blogs-details', $nextPost->slug) }}">
                                        <div class="title-with-link">
                                            <span class="intro">Next Post</span>
                                            <h3 class="title">{{ $nextPost->title }}</h3>
                                        </div>
                                    </a>
                                </div>
                            @endif
                        </div>

                    </div>
                </div>

                <!-- Comments -->
                {{-- <div class="blog-details single-post-item format-standard">
                    <div class="comment-area">
                        <div class="all-comments">
                            <h3 class="comments-title">{{ $post->comments->count() }} Comments</h3>
                            <div class="comment-list">
                                <ul>
                                    @foreach($post->comments as $comment)
                                    <li class="single-comment">
                                        <article>
                                            <div class="comment-author">
                                                <img src="{{ asset($comment->user->avatar ?? 'uploads/profile-photo.jpg') }}" alt="{{ $comment->user->name ?? 'User' }}" height="45">
                                            </div>
                                            <div class="comment-details">
                                                <div class="comment-meta">
                                                    <div class="comment-left-meta">
                                                        <h4 class="author-name">
                                                            {{ $comment->user->name ?? 'Anonymous' }}
                                                        </h4>
                                                        <div class="comment-date">{{ $comment->created_at->format('d M Y') }}</div>
                                                    </div>
                                                    <div class="comment-reply">
                                                        <a href="#" class="reply"><span class="icona"><i class="ti-back-left"></i></span> Reply</a>
                                                    </div>
                                                </div>
                                                <div class="comment-text">
                                                    <p>{{ $comment->content }}</p>
                                                </div>
                                            </div>
                                        </article>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>

                        <!-- Comment Form -->
                        <div class="comment-box submit-form">
                            <h3 class="reply-title">Post Comment</h3>
                            <div class="comment-form">
                                <form method="post" action="{{ route('page.blogs-comments.store', $post->id) }}">
                                    @csrf
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <input type="text" name="name" class="form-control" placeholder="Your Name" value="{{ old('name') }}" required>
                                                @error('name')<div class="text-danger mt-1">{{ $message }}</div>@enderror
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <input type="email" name="email" class="form-control" placeholder="Your Email" value="{{ old('email') }}" required>
                                                @error('email')<div class="text-danger mt-1">{{ $message }}</div>@enderror
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <textarea name="content" class="form-control" cols="30" rows="6" placeholder="Type your comments...." required>{{ old('content') }}</textarea>
                                                @error('content')<div class="text-danger mt-1">{{ $message }}</div>@enderror
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-main rounded full-width">Submit Now</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div> --}}

            </div>

            <!-- Sidebar -->
            <div class="col-lg-4 col-md-12 col-sm-12 col-12">
                <div class="single-widgets widget_search">
                    <h4 class="title">Search</h4>
                    <form method="GET" action="{{ route('page.blogs.search') }}" class="sidebar-search-form">
                        <input type="search" name="query" placeholder="Search.." required>
                        <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                </div>

                <div class="single-widgets widget_category">
                    <h4 class="title">Categories</h4>
                    <ul>
                        @foreach($categories as $category)
                        <li class="{{ $post->category->slug == $category->slug ? 'active' : '' }}">
                            <a href="{{ route('page.blogs.category', $category->slug) }}">
                                {{ $category->category_name }} <span>{{ $category->blog_posts_count }}</span>
                            </a>
                        </li>
                        @endforeach
                    </ul>
                </div>

                <div class="single-widgets widget_thumb_post">
                    <h4 class="title">Trending Posts</h4>
                    <ul>
                        @foreach($recentPosts as $recent)
                        <li>
                            <span class="left">
                                <img src="{{ asset($recent->image_path ?? 'uploads/profile-photo.jpg') }}" alt="{{ $recent->title }}">
                            </span>
                            <span class="right">
                                <a class="feed-title" href="{{ route('page.blogs-details', $recent->slug) }}">
                                    {{ \Illuminate\Support\Str::limit($recent->title, 50, '...') }}
                                </a>
                                <span class="post-date">
                                    <i class="ti-calendar"></i>{{ $recent->published_date?->format('d M Y') }}
                                </span>
                            </span>
                        </li>
                        @endforeach
                    </ul>
                </div>

                <div class="single-widgets widget_tags">
                    <h4 class="title">Tags Cloud</h4>
                    <ul>
                        @foreach($allTags as $tag)
                            <li><a href="{{ route('page.blogs-tag', $tag->slug) }}">{{ $tag->name }}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>
@endsection
