<?php

namespace Database\Seeders;

use App\Models\Promo;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PromoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Promo::create(['diskon' => '0', 'jumlah_pesanan' => '0']);
        Promo::create(['diskon' => '100', 'jumlah_pesanan' => '10']);
    }
}
