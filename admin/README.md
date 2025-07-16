# Medbase CMS Setup Guide

## Overview
This project uses Decap CMS (formerly Netlify CMS) to manage blog posts and other content. The CMS provides a user-friendly interface for creating, editing, and publishing blog posts without needing to work directly with markdown files.

## Features

### Blog Management
- **Rich Text Editor**: Write posts with a WYSIWYG editor
- **Image Upload**: Drag and drop images directly into posts
- **Categories & Tags**: Organize posts with predefined categories and custom tags
- **SEO Optimization**: Built-in fields for descriptions, keywords, and meta data
- **Draft/Publish**: Save posts as drafts or publish immediately
- **Preview**: Real-time preview of how posts will look on the website

### Content Organization
- **Blog Posts**: Full blog post management with rich content
- **Products**: Manage store products with images and details
- **Pages**: Edit site pages like the blog index and home page
- **Site Settings**: Configure site-wide settings

### Custom Components
- **Callout Boxes**: Add styled information boxes (info, warning, success, danger)
- **Medical Abbreviations**: Properly format medical terms with definitions
- **Image Galleries**: Multiple image support for products

## Accessing the CMS

### URL
Visit `/admin` on your website to access the CMS interface.

### Authentication
The CMS uses Netlify Identity for authentication. You'll need to:
1. Set up Netlify Identity in your Netlify dashboard
2. Invite users to access the CMS
3. Users will receive an email to set up their password

## Using the CMS

### Creating a New Blog Post
1. Go to `/admin` and log in
2. Click on "Blog Posts" in the sidebar
3. Click "New Blog Posts" button
4. Fill in the required fields:
   - **Title**: The main title of your post
   - **Publish Date**: When the post should be published
   - **Description**: Brief summary for SEO and previews
   - **Featured Image**: Main image for the post
   - **Categories**: Select up to 3 relevant categories
   - **Tags**: Add relevant tags for better organization
   - **Body**: Write your post content using the rich text editor

### Categories Available
- Medical Education
- Study Tips
- Healthcare
- Student Life
- Clinical Skills
- Anatomy
- Physiology
- Pharmacology
- Pathology
- Research
- Career Advice
- Technology
- News
- Events
- Resources

### Writing Tips
- Use headings (H2, H3) to structure your content
- Add images to break up text and make posts more engaging
- Use callout boxes for important information
- Include medical abbreviations with proper definitions
- Add relevant tags to help with content discovery

### Publishing
- **Draft**: Save as draft to work on later
- **Publish**: Make the post live immediately
- **Featured**: Mark important posts as featured

## File Structure

```
admin/
├── index.html          # CMS interface
├── config.yml          # CMS configuration
└── custom.css          # Custom styling

_posts/                 # Blog posts folder
├── 2024-12-23-example-post.md
└── ...

images/uploads/         # Uploaded images
├── image1.jpg
└── ...
```

## Configuration

### Adding New Categories
Edit `admin/config.yml` and add new options to the categories field:

```yaml
- { label: "Categories", name: "categories", widget: "select", multiple: true, options: ["New Category", "..."] }
```

### Customizing Fields
You can add new fields to blog posts by editing the `fields` section in `admin/config.yml`.

### Custom Components
The CMS includes custom components for:
- Callout boxes with different styles
- Medical abbreviations with hover definitions
- Image galleries for products

## Troubleshooting

### Can't Access Admin
- Check that Netlify Identity is properly configured
- Ensure you're invited as a user in the Netlify dashboard
- Clear browser cache and try again

### Images Not Uploading
- Check that the `media_folder` in config.yml is correct
- Ensure proper permissions are set up in Netlify
- Try reducing image file size

### Posts Not Appearing
- Ensure the post is marked as "Published"
- Check that the publish date is not in the future
- Verify the post has required fields filled

## Support

For technical issues with the CMS setup, check:
1. The Decap CMS documentation: https://decapcms.org/docs/
2. Netlify Identity documentation: https://docs.netlify.com/visitor-access/identity/
3. GitHub issues for specific problems

## Security

- Only authorized users can access the CMS
- All changes are tracked in Git
- Content is stored in your repository, not external servers
- Regular backups are handled by your Git provider

## Best Practices

1. **Regular Publishing**: Publish content regularly to keep the blog active
2. **SEO Optimization**: Always fill in descriptions and keywords
3. **Image Optimization**: Compress images before uploading
4. **Consistent Categorization**: Use consistent categories and tags
5. **Quality Content**: Focus on providing value to medical students
6. **Mobile-Friendly**: Preview posts on mobile devices
7. **Proofreading**: Always proofread before publishing

## Updates

The CMS is configured to automatically update from the Decap CMS CDN. For major updates:
1. Check the Decap CMS changelog
2. Test changes in a development environment
3. Update the CDN link in `admin/index.html` if needed
