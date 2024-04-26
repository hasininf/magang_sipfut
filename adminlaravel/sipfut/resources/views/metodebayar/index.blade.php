@extends('template')
@section('content')
    <div class="container mt-4">
        <div class="box-head">
            <a href="metodebayar/create" type="button" class="btn btn-primary">Tambah Data</a>

        </div>
        <div class="box-body mt-2">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Aksi</th>
                        <th scope="col">Waktu</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($metodebayars as $row)
                        <tr>
                            <th scope="row">
                                <a href="/metodebayar/{{ $row->id }}/edit" type="button"
                                    class="btn btn-primary btn-sm">Edit</a>
                                <form action="{{ route('metode_pembayarans.destroy', $row->id) }}" method="post">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger btn-sm">Hapus</button>
                                </form>


                            </th>
                            <td><img width="100px" src="{{ asset('storage/' . $row->gambar) }}" alt=""></td>
                            <td>{{ $row->nama }}</td>
                            <td>{{ $row->nomor }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
