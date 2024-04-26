@extends('template')
@section('content')
    <div class="container col-6">
        <div class="box-body">
            <form action="{{ route('lapangans.store') }}" method="POST" enctype="multipart/form-data">
                @csrf

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Lokasi</label>
                    <input type="text" name="lokasi" class="form-control" id="exampleFormControlInput1"
                        placeholder="Masukkan Lokasi">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Nama</label>
                    <input type="text" name="nama" class="form-control" id="exampleFormControlInput1"
                        placeholder="Masukkan Nama">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Harga</label>
                    <input type="text" name="harga" class="form-control" id="exampleFormControlInput1"
                        placeholder="Masukkan Nominal Harga">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Gambar</label>
                    <input type="file" name="gambar" class="form-control" id="exampleFormControlInput1"
                        placeholder="Masukkan Password">
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-outline-success">Login</button>
                    <button type="reset" class="btn btn-outline-danger">Batal</button>
                </div>
            </form>
        </div>
    </div>
@endsection
