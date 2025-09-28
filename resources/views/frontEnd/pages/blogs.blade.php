@extends('frontEnd.layouts.app')
@section('title', 'Blogs')
@section('breadcrumb')
    <!--Page Title-->
    <div class="page-title">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    
                    <h2 class="ipt-title">Our Articles</h2>
                    <span class="ipn-subtitle">See Our Latest Articles & News</span>
                    
                </div>
            </div>
        </div>
    </div>
    <!--End Page Title-->
@endsection

@section('content')
<!-- ============================ Blog List Start ================================== -->
<section class="gray-simple">
    <div class="container">

        <div class="row">
            <div class="col text-center">
                <div class="sec-heading center">
                    <h2>Latest News</h2>
                    <p>We post regulary most powerful articles for help and support.</p>
                </div>
            </div>
        </div>

        <!-- row Start -->
        <div class="row justify-content-center g-4">

            @forelse($blogPosts as $post)
            <!-- Single blog Grid -->
            <div class="col-xl-4 col-lg-4 col-md-6">
                <div class="blog-wrap-grid h-100 shadow">

                    <div class="blog-thumb">
                        <a href="{{ route('page.blogs-details', $post->slug) }}">
                            <img src="{{ $post->image_path ? asset($post->image_path) : asset('images/placeholder/blog-placeholder.jpg') }}"
                                 class="img-fluid" alt="{{ $post->title }}">
                        </a>
                    </div>

                    <div class="blog-info">
                        <span class="post-date label bg-green text-light">
                            <i class="ti-calendar"></i>
                            {{ $post->published_date?->format('d M Y') ?? 'Not published' }}
                        </span>
                    </div>

                    <div class="blog-body">
                        <h4 class="bl-title fw-medium">
                            <a href="{{ route('page.blogs-details', $post->slug) }}">
                                {{ Str::limit($post->title, 60) }}
                            </a>
                        </h4>
                        <p>{{ Str::limit($post->excerpt ?? $post->sub_title, 120) }}</p>
                        <a href="{{ route('page.blogs-details', $post->slug) }}" class="text-main fw-medium">
                            Continue<i class="fa-solid fa-arrow-right ms-2"></i>
                        </a>
                    </div>

                </div>
            </div>
            @empty
                <div class="col-12">
                    <div class="alert alert-info text-center">
                        No blog posts available yet. Check back soon!
                    </div>
                </div>
            @endforelse

        </div>
        <!-- /row -->

        <!-- Pagination -->
        @if($blogPosts->hasPages())
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <ul class="pagination p-center">
                    {{ $blogPosts->links('pagination::bootstrap-5') }}
                </ul>
            </div>
        </div>
        @endif

    </div>
</section>
<!-- ============================ Blog List End ================================== -->

@endsection
