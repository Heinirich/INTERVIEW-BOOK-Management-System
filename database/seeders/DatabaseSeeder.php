<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;


use App\Models\Author;
use App\Models\Setting;
use App\Models\Category;
use App\Models\LocationRack;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        \App\Models\User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@example.com',
            'password' => bcrypt('password')
        ]);

        Category::factory(10)->create();
        Author::factory(10)->create();
        LocationRack::factory(10)->create();

        Setting::create([
            'library_name' => 'INTERVIEW LIBRARY',
            'library_address' => 'Nairobi, Kenya',
            'library_phone' => '+254746273465',
            'library_email' => 'smithheinrich254@gmail.com',
            'fines' => '50',
        ]);
    }
}
