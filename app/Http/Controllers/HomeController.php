<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Models\ContactSubmission;
use App\Models\Testimonial;
use App\Models\Property;
use App\Models\Contact;
use App\Models\Country;
use App\Models\State;
use App\Models\PaymentMethod;
use App\Models\Application;
use App\Models\Achievement;
use App\Models\Service;
use App\Models\Category;
use App\Models\HeroBanner;
use App\Models\ApplicationSuccess;
use App\Models\Page;
use App\Models\BlogPost;
use App\Models\Tag;
use App\Helpers\ImageHelper;
use App\Http\Traits\SeoTrait;

class HomeController extends Controller
{
    use SeoTrait;

    public function welcome()
    {
        $heroBanner = HeroBanner::getActive();
        $categories = Category::where('status', 'active')->withCount('properties')->get();
        $rentProperties = Property::with('category', 'images')->where('status', 'active')->latest()->take(6)->get(); // ->where('property_status', 'For Rent')
        $saleProperties = Property::with('category', 'images')->where('status', 'active')->latest()->take(4)->get(); // ->where('property_status', 'For Sale')
        $testimonials = Testimonial::where('status', 'active')->latest()->take(10)->get();
        $achievements = Achievement::where('status', 'active')->orderBy('sort_order')->get();
        $services = Service::where('status', 'active')->orderBy('sort_order')->get();

        // SEO
        $page = Page::with('seo')->where('slug','home')->firstOrFail();
        $this->setSeo([
            'title'       => $page->seo->meta_title ?? $page->title,
            'description' => $page->seo->meta_description ?? '',
            'keywords'    => $this->formatKeywords($page->seo->meta_keywords ?? ''),
            'image'       => $page->seo->og_image ?? '',
            'canonical'   => url()->current(),
        ]);
        $seo_tags = $this->generateTags();

        $breadcrumbs = $this->generateBreadcrumbJsonLd([
            ['name' => 'Home', 'url' => url('/')],
        ]);

        return view('frontEnd.welcome', compact('heroBanner', 'categories', 'achievements', 'services','testimonials', 'rentProperties', 'saleProperties', 'seo_tags', 'breadcrumbs'));
    }
    /**________________________________________________________________________________________
     * About Menu Pages
     * ________________________________________________________________________________________
     */
    public function about()
    {
        // SEO
        $page = Page::with('seo')->where('slug','about')->firstOrFail();
        $this->setSeo([
            'title'       => $page->seo->meta_title ?? $page->title,
            'description' => $page->seo->meta_description ?? '',
            'keywords'    => $this->formatKeywords($page->seo->meta_keywords ?? ''),
            'image'       => $page->seo->og_image ?? '',
            'canonical'   => url()->current(),
        ]);
        $seo_tags = $this->generateTags();

        $breadcrumbs = $this->generateBreadcrumbJsonLd([
            ['name' => 'Home', 'url' => url('/')],
            ['name' => 'About', 'url' => url()->current()],
        ]);

        return view('frontEnd.pages.about-us', compact('seo_tags', 'breadcrumbs'));
    }
    /**________________________________________________________________________________________
     * About Menu Pages
     * ________________________________________________________________________________________
     */
    public function properties(Request $request)
    {
        $query = Property::query();

        // Filter by type
        if ($request->typeprt) {
            if ($request->typeprt == 'buy') {
                $query->where('property_status', 'For Sale');
            } elseif ($request->typeprt == 'rent') {
                $query->where('property_status', 'For Rent');
            }
        }

        // Filter by location (city, state, country)
        if ($request->location) {
            $location = $request->location;
            $query->where(function ($q) use ($location) {
                $q->where('city', 'like', "%$location%")
                  ->orWhere('state_county', 'like', "%$location%")
                  ->orWhere('country', 'like', "%$location%")
                  ->orWhere('address', 'like', "%$location%");
            });
        }

        // ✅ Filter by category
        if ($request->category) {
            $query->where('category_id', $request->category);
        }

        $properties = $query->latest()->paginate(10)->withQueryString();

        // SEO
        $page = Page::with('seo')->where('slug','properties')->firstOrFail();
        $this->setSeo([
            'title'       => $page->seo->meta_title ?? $page->title,
            'description' => $page->seo->meta_description ?? '',
            'keywords'    => $this->formatKeywords($page->seo->meta_keywords ?? ''),
            'image'       => $page->seo->og_image ?? '',
            'canonical'   => url()->current(),
        ]);
        $seo_tags = $this->generateTags();

        $breadcrumbs = $this->generateBreadcrumbJsonLd([
            ['name' => 'Home', 'url' => url('/')],
            ['name' => 'Projects', 'url' => url()->current()],
        ]);

        return view('frontEnd.pages.properties', compact('properties', 'seo_tags', 'breadcrumbs'));
    }

    public function propertyDetails($slug)
    {
        $property = Property::with('images')
            ->where('slug', $slug)
            ->where('status', 'active')
            ->firstOrFail();

        // Increment view count
        $property->increment('view_count');

        // SEO
        $this->setSeo([
            'title'       => $property->seo->meta_title ?? $property->title,
            'description' => $property->seo->meta_description ?? '',
            'keywords'    => $this->formatKeywords($property->seo->meta_keywords ?? ''),
            'image'       => $property->seo->og_image ?? '',
            'canonical'   => url()->current(),
        ]);
        $seo_tags = $this->generateTags();
        // $json_ld = $this->generateProductJsonLd($data);

        $breadcrumbs = $this->generateBreadcrumbJsonLd([
            ['name' => 'Home', 'url' => url('/')],
            ['name' => 'Project Details', 'url' => url()->current()],
        ]);

        return view('frontEnd.pages.property-details', compact('property', 'seo_tags', 'breadcrumbs'));
    }

     /**________________________________________________________________________________________
     * About Menu Pages
     * ________________________________________________________________________________________
     */
    public function contact()
    {
        $contactInfo = Contact::first();

        // SEO
        $page = Page::with('seo')->where('slug','contact')->firstOrFail();
        $this->setSeo([
            'title'       => $page->seo->meta_title ?? $page->title,
            'description' => $page->seo->meta_description ?? '',
            'keywords'    => $this->formatKeywords($page->seo->meta_keywords ?? ''),
            'image'       => $page->seo->og_image ?? '',
            'canonical'   => url()->current(),
        ]);
        $seo_tags = $this->generateTags();

        $breadcrumbs = $this->generateBreadcrumbJsonLd([
            ['name' => 'Home', 'url' => url('/')],
            ['name' => 'Contact', 'url' => url()->current()],
        ]);

        return view('frontEnd.pages.contact-us', compact('contactInfo', 'seo_tags', 'breadcrumbs'));
    }

    public function contactStore(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'subject' => 'required|string|max:255',
            'message' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        ContactSubmission::create($request->all());

        return redirect()->back()->with('success', 'Your message has been sent successfully!');
    }

     /**________________________________________________________________________________________
     * About Menu Pages
     * ________________________________________________________________________________________
     */
    public function applicationFrom()
    {
        $states = State::all();
        $countries = Country::all();
        $paymentMethods = PaymentMethod::where('status', 1)->get();

        return view('frontEnd.pages.application-from', compact('countries', 'states', 'paymentMethods'));
    }

    public function applicationSubmit(Request $request)
    {
        $data = $request->only([
            'move_in_date','application_type','full_name','email','phone',
            'current_address','city','state','zip_code','country','citizenship',
            'date_of_birth','monthly_income','government_id','issuing_state','ssn'
        ]);
        // Handle file uploads
        $files = ['id_front_path','id_back_path','selfie_path','income_path','payment_path'];
        foreach ($files as $file) {
            if ($request->hasFile($file)) {
                $data[$file] = ImageHelper::uploadImage($request->file($file), 'uploads/applications');
            }
        }
        $data['status'] = 'pending';
        Application::create($data);

        return redirect()->back()->with('success', 'Rental application submitted successfully!');
    }
    public function applicationSuccess()
    {
        $applicationSuccess = ApplicationSuccess::first();
        return view('frontEnd.pages.application-success', compact('applicationSuccess'));
    }

    /**________________________________________________________________________________________
     * Blog Menu Pages
     * ________________________________________________________________________________________
     */
    public function blogs()
    {
        $blogPosts = BlogPost::with(['author', 'category', 'tags'])
            ->where('status', 'published')
            ->where('published_date', '<=', now())
            ->orderBy('published_date', 'desc')
            ->paginate(8);

        $categories = Category::withCount('blogPosts')->get();
        $allTags = Tag::all();
        $recentPosts = BlogPost::latest()->take(5)->get();

        // SEO
        $page = Page::with('seo')->where('slug','blogs')->firstOrFail();
        $this->setSeo([
            'title'       => $page->seo->meta_title ?? $page->title,
            'description' => $page->seo->meta_description ?? '',
            'keywords'    => $this->formatKeywords($page->seo->meta_keywords ?? ''),
            'image'       => $page->seo->og_image ?? '',
            'canonical'   => url()->current(),
        ]);
        $seo_tags = $this->generateTags();

        $breadcrumbs = $this->generateBreadcrumbJsonLd([
            ['name' => 'Home', 'url' => url('/')],
            ['name' => 'Blogs', 'url' => url()->current()],
        ]);

        return view('frontEnd.pages.blogs', compact('blogPosts', 'categories', 'allTags', 'recentPosts', 'seo_tags', 'breadcrumbs'));
    }

    // Blog details page
    public function blogsDetails($slug)
    {
        $post = BlogPost::with(['author', 'category', 'tags', 'comments.replies'])
            ->where('slug', $slug)
            ->where('status', 'published')
            ->where('published_date', '<=', now())
            ->firstOrFail();

        // Get previous and next posts
        $previousPost = BlogPost::where('status', 'published')
            ->where('published_date', '<=', now())
            ->where('id', '<', $post->id)
            ->orderBy('id', 'desc')
            ->first();

        $nextPost = BlogPost::where('status', 'published')
            ->where('published_date', '<=', now())
            ->where('id', '>', $post->id)
            ->orderBy('id', 'asc')
            ->first();

        $categories = Category::withCount('blogPosts')->get();
        $recentPosts = BlogPost::where('status', 'published')
            ->where('published_date', '<=', now())
            ->latest()
            ->take(5)
            ->get();
        $allTags = Tag::all();

        // SEO
        $this->setSeo([
            'title'       => $post->seo->meta_title ?? $post->title,
            'description' => $post->seo->meta_description ?? '',
            'keywords'    => $this->formatKeywords($post->seo->meta_keywords ?? ''),
            'image'       => $post->seo->og_image ?? '',
            'canonical'   => url()->current(),
        ]);
        $seo_tags = $this->generateTags();
        // $json_ld = $this->generateProductJsonLd($data);

        $breadcrumbs = $this->generateBreadcrumbJsonLd([
            ['name' => 'Home', 'url' => url('/')],
            ['name' => 'Blog', 'url' => route('page.blogs')],
            ['name' => $post->title, 'url' => url()->current()],
        ]);

        return view('frontEnd.pages.blogs-details', compact(
            'post', 
            'previousPost', 
            'nextPost', 
            'categories', 
            'recentPosts', 
            'allTags', 
            'seo_tags', 
            'breadcrumbs'
        ));
    }
    // Blogs by tag
    public function blogsTag($slug)
    {
        $tag = Tag::where('slug', $slug)->firstOrFail();

        $blogPosts = $tag->blogPosts()
            ->with(['author', 'category', 'tags'])
            ->where('status', 'published')
            ->where('published_date', '<=', now())
            ->orderBy('published_date', 'desc')
            ->paginate(8);

        $categories = Category::withCount('blogPosts')->get();
        $allTags = Tag::all();
        $recentPosts = BlogPost::latest()->take(5)->get();

        return view('frontEnd.pages.blogs', compact('blogPosts', 'tag', 'categories', 'allTags', 'recentPosts'));
    }

    // Blogs by category
    public function blogsCategory($slug)
    {
        $category = Category::where('slug', $slug)->firstOrFail();

        $blogPosts = BlogPost::where('category_id', $category->id)
            ->where('status', 'published')
            ->where('published_date', '<=', now())
            ->with(['author', 'tags'])
            ->orderBy('published_date', 'desc')
            ->paginate(8);

        $categories = Category::withCount('blogPosts')->get();
        $allTags = Tag::all();
        $recentPosts = BlogPost::latest()->take(5)->get();

        return view('frontEnd.pages.blogs', compact('blogPosts', 'category', 'categories', 'allTags', 'recentPosts'));
    }

    // Blogs by search
    public function blogsSearch(Request $request)
    {
        $query = $request->input('query');

        $blogPosts = BlogPost::where(function($q) use ($query) {
                $q->where('title', 'like', "%{$query}%")
                  ->orWhere('content', 'like', "%{$query}%");
            })
            ->where('status', 'published')
            ->where('published_date', '<=', now())
            ->with(['author', 'category', 'tags'])
            ->orderBy('published_date', 'desc')
            ->paginate(8);

        $categories = Category::withCount('blogPosts')->get();
        $allTags = Tag::all();
        $recentPosts = BlogPost::latest()->take(5)->get();

        return view('frontEnd.pages.blogs', compact('blogPosts', 'query', 'categories', 'allTags', 'recentPosts'));
    }

    // Store comment
    public function blogsCommentsStore(Request $request, BlogPost $blog)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'content' => 'required|string',
            'parent_id' => 'nullable|exists:blog_comments,id',
        ]);

        $blog->comments()->create([
            'parent_id' => $validated['parent_id'] ?? null,
            'name' => $validated['name'],
            'email' => $validated['email'],
            'content' => $validated['content'],
        ]);

        return back()->with('success', 'Comment submitted successfully!');
    }

}
