@extends('template')
@section('content')
    <div class="container col-6">
        <div class="box-body">
            <form action="{{ route('metode_pembayarans.store') }}" method="POST" enctype="multipart/form-data">
                @csrf


                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Nama Bank</label>
                    <input type="text" name="nama" class="form-control" id="exampleFormControlInput1">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Nomor</label>
                    <input type="text" name="nomor" class="form-control" id="exampleFormControlInput1">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Logo</label>
                    <input type="file" name="gambar" class="form-control" id="exampleFormControlInput1"
                        placeholder="Ex. 07:00">
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-outline-success">Simpan</button>
                    <button type="reset" class="btn btn-outline-danger">Batal</button>
                </div>
            </form>
        </div>
    </div>
@endsection
